
library unscripted.src.util;

import 'dart:async';
import 'dart:collection';
import 'dart:mirrors';
import 'dart:io';

import 'package:args/args.dart' show ArgParser, ArgResults;
import 'package:collection/iterable_zip.dart';
import 'package:mockable_filesystem/filesystem.dart' as filesystem;

import '../unscripted.dart';
import 'script_impl.dart';
import 'string_codecs.dart';
import 'usage.dart';
import 'invocation_maker.dart';
import 'group_annotations.dart';

/// A base class for script annotations which include help.
class HelpAnnotation {
  /// The help text to include for this part of the command line interface.
  ///
  /// Can either be a `String` or a nullary function which returns one.
  final help;

  const HelpAnnotation({this.help});
}

class BaseCommand extends HelpAnnotation {
  /// Whether to allow options after positional arguments.
  final bool allowTrailingOptions;

  const BaseCommand({help, this.allowTrailingOptions}) : super(help: help);
}

Rest getRestFromMethod(MethodMirror method) {
  var lastParameter = method.parameters.lastWhere(
      (parameter) => !parameter.isOptional,
      orElse: () => null);
  if(lastParameter != null) {
    Rest rest = getFirstMetadataMatch(lastParameter,
        (metadata) => metadata is Rest);

    var restName = getDefaultPositionalName(lastParameter.simpleName);
    var type = lastParameter.type;
    var parserFromTypeArgument;
    if(type.originalDeclaration == reflectClass(List) &&
       type.typeArguments.isNotEmpty) {
      parserFromTypeArgument = getParserFromType(type.typeArguments.single);
    }

    if(rest != null) {
      var parser = rest.parser;
      if(parser == null) {
        parser = parserFromTypeArgument;
      }
      if(rest.valueHelp != null) {
        restName = rest.valueHelp;
      }
      var allowed;
      if(rest.allowed != null) {
        allowed = rest.allowed;
      }
      rest = new Rest(
          allowed: allowed,
          required: rest.required,
          help: rest.help,
          valueHelp: restName,
          parser: parser);
    } else if(parserFromTypeArgument != null) {
      rest = new Rest(valueHelp: restName, parser: parserFromTypeArgument);
    }

    return rest;
  }
  return null;
}

getDefaultPositionalName(Symbol symbol) {
  return dashesToCamelCase.decode(MirrorSystem.getName(symbol));
  // return MirrorSystem.getName(symbol).toUpperCase();
}

Usage getUsageFromFunction(MethodMirror methodMirror, DeclarationScript script, {Usage usage}) {

  if(usage == null) usage = new Usage();
  script.usageOptionParameterMap[usage] = {};
  script.usageOptionGroupParameterMap[usage] = {};

  usage.rest = getRestFromMethod(methodMirror);

  _addCommandMetadata(usage, methodMirror);

  var parameters = methodMirror.parameters;

  var required = parameters
      .where((parameter) => !parameter.isOptional).toList();
  if(usage.rest != null) required.removeLast();

  var positionals = required.map((parameter) {
    Positional positional = getFirstMetadataMatch(
        parameter, (metadata) => metadata is Positional);

    String positionalName = getDefaultPositionalName(parameter.simpleName);
    String positionalHelp;
    var parser;
    var allowed;

    if(positional != null) {
      if(positional.valueHelp != null) {
        positionalName = positional.valueHelp;
      }
      if(positional.allowed != null) {
        allowed = positional.allowed;
      }
      positionalHelp = positional.help;
      parser = positional.parser;
    }

    if(parser == null) {
      parser = getParserFromType(parameter.type);
    }

    return new Positional(allowed: allowed, valueHelp: positionalName, help: positionalHelp, parser: parser);
  });

  positionals.forEach((positional) =>
      usage.addPositional(positional));

  OptionGroup currentGroup = usage.optionGroups.first;

  parameters.where((parameter) => parameter.isNamed).forEach((parameter) {

    var parameterName = MirrorSystem.getName(parameter.simpleName);

    InstanceMirror groupAnnotation = parameter.metadata.firstWhere((annotation) =>
        annotation.reflectee is GroupMarker, orElse: () => null);

    if (groupAnnotation != null) {
      GroupMarker group = groupAnnotation.reflectee;
      if (group is CombinedGroup) {
        var combinedGroup = usage.addOptionGroup(title: group.title, help: group.help, hide: group.hide);

        // Add all the options to the group.
        var groupOptions = group.getOptions();
        groupOptions.forEach(combinedGroup.addOption);

        // Store a mapping from the group to the parameter representing it.
        script.usageOptionGroupParameterMap[usage][combinedGroup] = parameterName;

        // Reset the current group back to the default group.
        currentGroup = usage.optionGroups.first;

        // Return, since we already added Don't look for an single-option in this case.
        return;
      }

      if (group is StartGroup) {
        currentGroup = usage.addOptionGroup(title: group.title, help: group.help, hide: group.hide);
      }
    }

    Option option;
    var type = parameter.type;

    InstanceMirror argAnnotation = parameter.metadata.firstWhere((annotation) =>
        annotation.reflectee is Option, orElse: () => null);

    if(argAnnotation != null) {
      option = argAnnotation.reflectee;
    } else if(type == reflectClass(bool)) {
      option = new Flag();
    } else {
      option = new Option();
    }

    var parser = option.parser;
    if(parser == null) {
      parser = getParserFromType(type);
    }

    var allowMultiple = option.allowMultiple;

    if(parser == null && type.originalDeclaration == reflectClass(List)) {
      allowMultiple = true;
      if(type.typeArguments.isNotEmpty){
        parser = getParserFromType(type.typeArguments.single);
      }
    }

    var defaultValue = option.defaultsTo;
    if(defaultValue == null && parameter.hasDefaultValue) {
      defaultValue = parameter.defaultValue.reflectee;
    }

    var optionName = dashesToCamelCase.decode(option.name != null
        ? option.name : parameterName);

    // Update option with any configuration detected in the parameter.
    // TODO: This is not very maintainable.
    // Use reflection instead to copy values over?
    option = option is Flag ?
        new Flag(help: option.help, abbr: option.abbr, hide: option.hide,
            defaultsTo: defaultValue, negatable: option.negatable,
            name: optionName) :
        new Option(help: option.help, abbr: option.abbr,
            defaultsTo: defaultValue, allowed: option.allowed,
            allowMultiple: allowMultiple, hide: option.hide,
            valueHelp: option.valueHelp, parser: parser, name: optionName);

    script.usageOptionParameterMap[usage][optionName] = parameterName;
    currentGroup.addOption(option);
  });

  _addSubCommandsForClass(usage, script, methodMirror.returnType);

  return usage;
}

getParserFromType(TypeMirror typeMirror) {
  if(typeMirror is ClassMirror &&
      typeMirror.declarations.values.any((d) =>
          d.isStatic && d.simpleName == #parse)) {
    return (String item) => typeMirror.invoke(#parse, [item]).reflectee;
  }
  return null;
}

_addSubCommandsForClass(Usage usage, DeclarationScript script, TypeMirror typeMirror) {
  if(typeMirror is ClassMirror) {

    var methods = typeMirror.instanceMembers.values;

    Map<MethodMirror, SubCommand> subCommands = {};

    methods.forEach((methodMirror) {
      var subCommand = methodMirror.metadata
          .map((im) => im.reflectee)
          .firstWhere(
              (v) => v is SubCommand,
              orElse: () => null);

      if(subCommand != null) {
        subCommands[methodMirror] = subCommand;
      }
    });

    subCommands.forEach((methodMirror, subCommand) {
      var commandName = dashesToCamelCase
          .decode(MirrorSystem.getName(methodMirror.simpleName));
      getUsageFromFunction(
          methodMirror,
          script,
          usage: usage.addCommand(commandName, subCommand));
    });
  }
}

_addCommandMetadata(Usage usage, DeclarationMirror declaration) {
  BaseCommand command = getFirstMetadataMatch(
      declaration, (metadata) => metadata is BaseCommand);
  if(command is Command && usage.parent == null) {
    usage.allowTrailingOptions = (command.allowTrailingOptions != null) ?
        command.allowTrailingOptions :
        false;
  }
  var description = command == null ? '' : command.help;
  usage.description = description;
  Iterable<ArgExample> examples = declaration.metadata
      .map((annotation) => annotation.reflectee)
      .where((metadata) => metadata is ArgExample);
  examples.forEach(usage.addExample);
}

getFirstMetadataMatch(DeclarationMirror declaration, bool match(metadata)) {
  return declaration.metadata
      .map((annotation) => annotation.reflectee)
      .firstWhere(match, orElse: () => null);
}

void addOptionToParser(ArgParser parser, Option option) {

  var suffix;

  var props = {
    #abbr: option.abbr,
    #help: option.help,
    #hide: option.hide
  };

  if(option is Flag) {
    suffix = 'Flag';
    props.addAll({
      #negatable: option.negatable
    });
  } else {
    suffix = 'Option';

    var allowed = option.allowed;
    if(allowed != null && allowed is! Function) {
      if(allowed is Map<String, String>) {
        allowed = allowed.keys.toList();
        props[#allowedHelp] = option.allowed;
      }
      props[#allowed] = allowed;
    }
    props.addAll({
      #allowMultiple: option.allowMultiple,
    });
  }

  var namedParameters = props.keys.fold({}, ((ret, prop) {
    var value = props[prop];
    if(value != null) {
      ret[prop] = value;
    }
    return ret;
  }));

  var parserMethod = 'add$suffix';

  reflect(parser).invoke(new Symbol(parserMethod), [option.name], namedParameters);
}

// Returns a List whose elements are the required argument count, and whether
// there is a Rest parameter.
List getPositionalParameterInfo(MethodMirror methodMirror) {
  var positionals = methodMirror.parameters.where((parameter) =>
      !parameter.isNamed);

  // TODO: Find a better place for this check.
  if(positionals.any((positional) => positional.isOptional)) {
    throw new ArgumentError('Cannot use optional positional parameters.');
  }
  var requiredPositionals =
      positionals.where((parameter) => !parameter.isOptional);

  var isRest = false;
  if(requiredPositionals.isNotEmpty) {

    var lastFuncPositional = requiredPositionals.last;

    var isRestAnnotated = lastFuncPositional.metadata
        .map((annotation) => annotation.reflectee)
        .any((metadata) => metadata is Rest);
    // TODO: How to check if the type is List or List<String> ?
    // var isList = lastFuncPositional.type == reflectClass(List);
    isRest = isRestAnnotated;// || isList;
  }

  return [requiredPositionals.length - (isRest ? 1 : 0), isRest];
}

getRestParameterIndex(MethodMirror methodMirror) {
  var positionalParameterInfo = getPositionalParameterInfo(methodMirror);
  return positionalParameterInfo[1] ?
      positionalParameterInfo[0] :
        null;
}

MethodMirror getUnnamedConstructor(ClassMirror classMirror) {
  var constructors = classMirror.declarations.values
  .where((d) => d is MethodMirror && d.isConstructor);

  return constructors.firstWhere((constructor) =>
      constructor.constructorName == const Symbol(''), orElse: () => null);
}

convertCommandInvocationToInvocation(CommandInvocation commandInvocation, MethodMirror method, DeclarationScript script, Usage usage, {Symbol memberName: #call}) {

  var positionals = commandInvocation.positionals;

  var named = {};

  script.usageOptionGroupParameterMap[usage].forEach((optionGroup, parameter) {
    var optionMap = {};
    optionGroup.options.forEach((name, option) {
      if (commandInvocation.options.containsKey(name)) {
        optionMap[name] = commandInvocation.options[name];
      }
    });
    var paramSymbol = new Symbol(parameter);
    named[paramSymbol] = new UnmodifiableMapView(optionMap);
  });

  script.usageOptionParameterMap[usage].forEach((option, parameter) {
    var paramSymbol = new Symbol(parameter);
    named[paramSymbol] = commandInvocation.options[option];
  });

  return new InvocationMaker.method(memberName, positionals, named).invocation;
}

parseInput(String arg, {filesystem.FileSystem fileSystem}) {
  if(fileSystem == null) {
    fileSystem = filesystem.fileSystem;
  }
  return _parseIOArg(arg, stdin, (stdin) => new _StdInput(stdin),
      (file) => new _FileInput(file), fileSystem);
}

parseOutput(String arg, {filesystem.FileSystem fileSystem}) {
  if(fileSystem == null) {
    fileSystem = filesystem.fileSystem;
  }
  return _parseIOArg(arg, stdout, (stdout) => new _StdOutput(stdout),
      (file) => new _FileOutput(file), fileSystem);
}

_parseIOArg(String arg, stdio, convertStdio(stdio), convertFile(file), filesystem.FileSystem fileSystem) {

  if(arg == '-') return convertStdio(stdio);

  var file = fileSystem.getFile(arg);

  if(!file.existsSync()) {
    throw 'File path does not exist or is not a file: ${file.path}';
  }

  return convertFile(file);
}

class _FileInput implements Input {

  File _file;

  _FileInput(this._file);

  String get path => _file.path;
  List<String> get lines => _file.readAsLinesSync();
  Stream<List<int>> get stream => _file.openRead();
  String get text => _file.readAsStringSync();
}

class _StdInput implements Input {

  Stdin _stdin;

  _StdInput(this._stdin);

  String get path => null;
  List<String> get lines => _getStdinLines(_stdin);
  Stdin get stream => _stdin;
  String get text => _getStdinLines(_stdin, true).join();
}

class _StdOutput implements Output {

  final IOSink _sink;

  _StdOutput(this._sink);

  String get path => null;
  IOSink get sink => _sink;
}

class _FileOutput implements Output {

  final File _file;

  _FileOutput(this._file);

  String get path => _file.path;
  IOSink get sink {
    if(_sink == null) _sink = _file.openWrite();
    return _sink;
  }

  IOSink _sink;
}

List<String> _getStdinLines(Stdin stdin, [bool retainNewlines = false]) {
  var lines = [];
  String line;
  while((line = stdin.readLineSync(retainNewlines: retainNewlines)) != null) {
    lines.add(line);
  }
  return lines;
}

String formatColumns(
    Iterable<Iterable<String>> cells,
    Iterable<Function> formatters, {
      int separateBy: 4
    }) {

  formatters = formatters.map((f) => f == null ? (x) => x : f);
  var widths = new IterableZip(cells).map((column) =>
      column.isEmpty ? null : column.map((s) => s.length).reduce((a, b) => Comparable.compare(a, b) > 0 ? a : b)).toList();
  var cellsWithMetadata = cells.map((line) => new IterableZip([line, widths, formatters]));
  var formattedCells = cellsWithMetadata.map((lineCells) => lineCells.map((cellWithMetadata) {
    var cell = cellWithMetadata[0];
    var width = cellWithMetadata[1];
    var formatter = cellWithMetadata[2];
    return formatter(cell) + (' ' * ((width - cell.length) + separateBy));
  }));

  return formattedCells.map((formattedLineCells) => formattedLineCells.join()).join('\n');
}

// TODO: Move to quiver.
Map mapWhere(Map map, bool where(key, value)) => map.keys.fold({}, (result, key) {
  if(where(key, map[key])) result[key] = map[key];
  return result;
});

typedef Nullary();
