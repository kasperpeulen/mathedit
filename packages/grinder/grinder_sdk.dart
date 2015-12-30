// Copyright 2013 Google. All rights reserved. Use of this source code is
// governed by a BSD-style license that can be found in the LICENSE file.

/// A library to access tools in the Dart SDK.
library grinder.sdk;

import 'dart:async';
import 'dart:io';

import 'package:cli_util/cli_util.dart' as cli_util;
import 'package:path/path.dart' as path;
import 'package:which/which.dart';

import 'grinder.dart';
import 'src/run.dart' as runlib;
import 'src/run_utils.dart';
import 'src/utils.dart';

bool _sdkOnPath;

/// A set of common top-level directories according to the Pub package layout
/// convention which usually contain Dart source code.
final Set<Directory> sourceDirs = [
  'bin',
  'example',
  'lib',
  'test',
  'tool',
  'web'
].map((path) => new Directory(path)).toSet();

/// The subset of directories in [sourceDirs] which actually exist in the
/// current working directory.
Set<Directory> get existingSourceDirs => Directory.current
    .listSync()
    .where((f) => f is Directory)
    .map((d) => new Directory(path.relative(d.path)))
    .where((d) => sourceDirs.any((sd) => sd.path == d.path))
    .toSet();

/**
 * Return the path to the current Dart SDK. This will return `null` if we are
 * unable to locate the Dart SDK.
 *
 * See also [getSdkDir].
 */
Directory get sdkDir => getSdkDir(grinderArgs());

/**
 * Return the path to the current Dart SDK. This will return `null` if we are
 * unable to locate the Dart SDK.
 *
 * This is an alias for the `cli_util` package's `getSdkDir()` method.
 */
Directory getSdkDir([List<String> cliArgs]) => cli_util.getSdkDir(cliArgs);

File get dartVM => joinFile(sdkDir, ['bin', sdkBin('dart')]);

/// Return the path to a binary in the SDK's `bin/` directory. This will handle
/// appending `.bat` or `.exe` on Windows. This is useful for finding the path
/// to SDK utilities like `dartdoc`, `dart2js`, ...
String sdkBin(String name) {
  if (Platform.isWindows) {
    return name == 'dart' ? 'dart.exe' : '${name}.bat';
  } else if (Platform.isMacOS) {
    // If `dart` is not visible, we should join the sdk path and `bin/$name`.
    // This is only necessary in unusual circumstances, like when the script is
    // run from the Editor on macos.
    if (_sdkOnPath == null) {
      _sdkOnPath = whichSync('dart', orElse: () => null) != null;
    }

    return _sdkOnPath ? name : '${sdkDir.path}/bin/${name}';
  } else {
    return name;
  }
}

/// Utility tasks for for getting information about the Dart VM and for running
/// Dart applications.
///
/// The custom named parameters (e.g. vmNewGenHeapMB) will override
/// args set in `vmArgs`.
class Dart {
  /// Run a dart [script] using [runlib.run]. Returns the stdout.
  static String run(String script,
      {List<String> arguments: const [],
      bool quiet: false,
      String packageRoot,
      RunOptions runOptions, //
      String workingDirectory, //
      List<String> vmArgs: const []}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    List<String> args = _buildArgs(script, arguments, packageRoot, vmArgs);

    return runlib.run(sdkBin('dart'),
        arguments: args, quiet: quiet, runOptions: runOptions);
  }

  static Future<String> runAsync(String script,
      {List<String> arguments: const [],
      bool quiet: false,
      String packageRoot,
      RunOptions runOptions, //
      List<String> vmArgs: const []}) {
    List<String> args = _buildArgs(script, arguments, packageRoot, vmArgs);

    return runlib.runAsync(sdkBin('dart'),
        arguments: args, quiet: quiet, runOptions: runOptions);
  }

  static String version({bool quiet: false}) {
    // TODO: We may want to run `dart --version` in order to know the version
    // of the SDK that grinder has located.
    // runlib.run(sdkBin('dart'), arguments: ['--version'], quiet: quiet);
    // The stdout does not have a stable documented format, so use the provided
    // metadata instead.
    return Platform.version.substring(0, Platform.version.indexOf(' '));
  }

  static List<String> _buildArgs(String script, List<String> arguments,
      String packageRoot, List<String> vmArgs) {
    List<String> args = [];

    if (vmArgs != null) {
      args.addAll(vmArgs);
    }

    if (packageRoot != null) {
      args.add('--package-root=${packageRoot}');
    }

    return args
      ..add(script)
      ..addAll(arguments);
  }
}

//class DartSdk {
//  /// Return the path to the current Dart SDK. This will return `null` if we are
//  /// unable to locate the Dart SDK.
//  static Directory get location => sdkDir;
//}

/**
 * Utility tasks for executing pub commands.
 */
class Pub {
  static PubGlobal _global = new PubGlobal._();

  /**
   * Run `pub get` on the current project. If [force] is true, this will execute
   * even if the pubspec.lock file is up-to-date with respect to the
   * pubspec.yaml file.
   */
  static void get(
      {bool force: false, RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    final prefix = runOptions.workingDirectory == null
        ? ''
        : '${runOptions.workingDirectory}/';
    FileSet pubspec = new FileSet.fromFile(getFile('${prefix}pubspec.yaml'));
    FileSet publock = new FileSet.fromFile(getFile('${prefix}pubspec.lock'));

    if (force || !publock.upToDate(pubspec)) {
      _run('get', runOptions: runOptions);
    }
  }

  /**
   * Run `pub get` on the current project. If [force] is true, this will execute
   * even if the pubspec.lock file is up-to-date with respect to the
   * pubspec.yaml file.
   */
  static Future getAsync(
      {bool force: false, RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    final prefix = runOptions.workingDirectory == null
        ? ''
        : '${runOptions.workingDirectory}/';
    FileSet pubspec = new FileSet.fromFile(getFile('${prefix}pubspec.yaml'));
    FileSet publock = new FileSet.fromFile(getFile('${prefix}pubspec.lock'));

    if (force || !publock.upToDate(pubspec)) {
      return runlib
          .runAsync(sdkBin('pub'), arguments: ['get'], runOptions: runOptions)
          .then((_) => null);
    }

    return new Future.value();
  }

  /// Run `pub upgrade` on the current project.
  static void upgrade({RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    _run('upgrade', runOptions: runOptions);
  }

  /// Run `pub upgrade` on the current project.
  static Future upgradeAsync({RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    return runlib
        .runAsync(sdkBin('pub'), arguments: ['upgrade'], runOptions: runOptions)
        .then((_) => null);
  }

  /// Run `pub downgrade` on the current project.
  static void downgrade({RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    _run('downgrade', runOptions: runOptions);
  }

  /// Run `pub downgrade` on the current project.
  static Future downgradeAsync(
      {RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    return runlib
        .runAsync(sdkBin('pub'),
            arguments: ['downgrade'], runOptions: runOptions)
        .then((_) => null);
  }

  /**
   * Run `pub build` on the current project.
   *
   * The valid values for [mode] are `release` and `debug`.
   */
  static void build(
      {String mode,
      List<String> directories,
      RunOptions runOptions,
      String outputDirectory,
      String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    List args = ['build'];
    if (mode != null) args.add('--mode=${mode}');
    if (outputDirectory != null) args.add('--output=${outputDirectory}');
    if (directories != null && directories.isNotEmpty) args.addAll(directories);

    runlib.run(sdkBin('pub'), arguments: args, runOptions: runOptions);
  }

  /**
   * Run `pub build` on the current project.
   *
   * The valid values for [mode] are `release` and `debug`.
   */
  static Future buildAsync(
      {String mode,
      List<String> directories,
      RunOptions runOptions,
      String outputDirectory,
      String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    List args = ['build'];
    if (mode != null) args.add('--mode=${mode}');
    if (outputDirectory != null) args.add('--output=${outputDirectory}');
    if (directories != null && directories.isNotEmpty) args.addAll(directories);

    return runlib
        .runAsync(sdkBin('pub'), arguments: args, runOptions: runOptions)
        .then((_) => null);
  }

  /// Run `pub run` on the given [package] and [script].
  ///
  /// If [script] is null it defaults to the same value as [package].
  static String run(String package,
      {List<String> arguments,
      RunOptions runOptions,
      String script,
      String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    var scriptArg = script == null ? package : '$package:$script';
    List args = ['run', scriptArg];
    if (arguments != null) args.addAll(arguments);
    return runlib.run(sdkBin('pub'), arguments: args, runOptions: runOptions);
  }

  /// Run `pub run` on the given [package] and [script].
  ///
  /// If [script] is null it defaults to the same value as [package].
  static Future<String> runAsync(String package,
      {List<String> arguments, RunOptions runOptions, String script}) {
    var scriptArg = script == null ? package : '$package:$script';
    List args = ['run', scriptArg];
    if (arguments != null) args.addAll(arguments);
    return runlib.runAsync(sdkBin('pub'),
        arguments: args, runOptions: runOptions);
  }

  static String version({bool quiet: false}) =>
      _parseVersion(_run('--version', quiet: quiet));

  static PubGlobal get global => _global;

  static String _run(String command,
      {bool quiet: false, RunOptions runOptions}) {
    return runlib.run(sdkBin('pub'),
        quiet: quiet, arguments: [command], runOptions: runOptions);
  }
}

/// Utility tasks for invoking dart2js.
class Dart2js {
  /// Invoke a dart2js compile with the given [sourceFile] as input.
  static void compile(File sourceFile,
      {Directory outDir,
      File outFile,
      bool minify: false,
      bool csp: false,
      bool enableExperimentalMirrors: false}) {
    if (outFile == null) {
      if (outDir == null) outDir = sourceFile.parent;
      outFile = joinFile(outDir, ["${fileName(sourceFile)}.js"]);
    } else {
      outDir = outFile.parent;
    }

    if (!outDir.existsSync()) outDir.createSync(recursive: true);

    List args = [];
    if (minify) args.add('--minify');
    if (csp) args.add('--csp');
    if (enableExperimentalMirrors) args.add('--enable-experimental-mirrors');
    args.add('-o${outFile.path}');
    args.add(sourceFile.path);

    runlib.run(sdkBin('dart2js'), arguments: args);
  }

  /// Invoke a dart2js compile with the given [sourceFile] as input.
  static Future compileAsync(File sourceFile,
      {Directory outDir,
      File outFile,
      bool minify: false,
      bool csp: false,
      bool enableExperimentalMirrors: false}) {
    if (outFile == null) {
      if (outDir == null) outDir = sourceFile.parent;
      outFile = joinFile(outDir, ["${fileName(sourceFile)}.js"]);
    } else {
      outDir = outFile.parent;
    }

    if (!outDir.existsSync()) outDir.createSync(recursive: true);

    List args = [];
    if (minify) args.add('--minify');
    if (csp) args.add('--csp');
    if (enableExperimentalMirrors) args.add('--enable-experimental-mirrors');
    args.add('-o${outFile.path}');
    args.add(sourceFile.path);

    return runlib
        .runAsync(sdkBin('dart2js'), arguments: args)
        .then((_) => null);
  }

  static String version({bool quiet: false}) =>
      _parseVersion(_run('--version', quiet: quiet));

  static String _run(String command, {bool quiet: false}) =>
      runlib.run(sdkBin('dart2js'), quiet: quiet, arguments: [command]);
}

/// Utility class for invoking dartdoc.
class DartDoc {
  static void doc() {
    runlib.run(sdkBin('dartdoc'));
  }

  static Future docAsync() => runlib.runAsync(sdkBin('dartdoc'));
}

/**
 * Utility tasks for invoking the analyzer.
 */
class Analyzer {
  /// Analyze a [File], a path ([String]), or a list of files or paths.
  static void analyze(fileOrPaths,
      {Directory packageRoot, bool fatalWarnings: false}) {
    List args = [];
    if (packageRoot != null) args.add('--package-root=${packageRoot.path}');
    if (fatalWarnings) args.add('--fatal-warnings');
    args.addAll(findDartSourceFiles(coerceToPathList(fileOrPaths)));
    runlib.run(sdkBin('dartanalyzer'), arguments: args);
  }

  /// Analyze one or more [File]s or paths ([String]).
  @Deprecated('see `analyze`, which now takes a list as an argument')
  static void analyzeFiles(List files,
      {Directory packageRoot, bool fatalWarnings: false}) {
    List args = [];
    if (packageRoot != null) args.add('--package-root=${packageRoot.path}');
    if (fatalWarnings) args.add('--fatal-warnings');
    args.addAll(coerceToPathList(files));

    runlib.run(sdkBin('dartanalyzer'), arguments: args);
  }

  static String version({bool quiet: false}) => _parseVersion(runlib
      .run(sdkBin('dartanalyzer'), quiet: quiet, arguments: ['--version']));
}

/// Utility class for invoking `dartfmt` from the SDK. This wrapper requires
/// the `dartfmt` from SDK 1.9 and greater.
class DartFmt {
  /// Run the `dartfmt` command with the `--overwrite` option. Format a file, a
  /// directory or a list of files or directories in place.
  static void format(fileOrPath, {int lineLength}) {
    _run('--overwrite', coerceToPathList(fileOrPath), lineLength: lineLength);
  }

  /// Run the `dartfmt` command with the `--dry-run` option. Return `true` if
  /// any files would be changed by running the formatter.
  static bool dryRun(fileOrPath, {int lineLength}) {
    String results =
        _run('--dry-run', coerceToPathList(fileOrPath), lineLength: lineLength);
    return results.trim().isNotEmpty;
  }

  static String _run(String option, List<String> targets,
      {bool quiet: false, int lineLength}) {
    List args = [option];
    if (lineLength != null) args.add('--line-length=${lineLength}');
    args.addAll(targets);
    return runlib.run(sdkBin('dartfmt'), quiet: quiet, arguments: args);
  }
}

/// Access the `pub global` commands.
class PubGlobal {
  Set<String> _activatedPackages;

  PubGlobal._();

  /// Install a new Dart application.
  void activate(String packageName, {bool force: false}) {
    if (force || !isActivated(packageName)) {
      runlib.run(sdkBin('pub'), arguments: ['global', 'activate', packageName]);
      _activatedPackages.add(packageName);
    }
  }

  /// Run the given installed Dart application.
  String run(String package,
      {List<String> arguments,
      RunOptions runOptions,
      String script,
      String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    var scriptArg = script == null ? package : '$package:$script';
    List args = ['global', 'run', scriptArg];
    if (arguments != null) args.addAll(arguments);
    return runlib.run(sdkBin('pub'), arguments: args, runOptions: runOptions);
  }

  /// Run the given installed Dart application.
  Future<String> runAsync(String package,
      {List<String> arguments, RunOptions runOptions, String script}) {
    var scriptArg = script == null ? package : '$package:$script';
    List args = ['global', 'run', scriptArg];
    if (arguments != null) args.addAll(arguments);
    return runlib.runAsync(sdkBin('pub'),
        arguments: args, runOptions: runOptions);
  }

  /// Return the list of installed applications.
  List<PubApp> list() {
    //dart_coveralls 0.1.8
    //den 0.1.3
    //discoveryapis_generator 0.6.1
    //...

    var stdout =
        runlib.run(sdkBin('pub'), arguments: ['global', 'list'], quiet: true);

    var lines = stdout.trim().split('\n');
    return lines.map((line) {
      line = line.trim();
      if (!line.contains(' ')) return new PubApp.global(line);
      return new PubApp.global(line.split(' ').first);
    }).toList();
  }

  /// Returns whether the given Dart application is installed.
  bool isActivated(String packageName) {
    if (_activatedPackages == null) _initActivated();
    return _activatedPackages.contains(packageName);
  }

  void _initActivated() {
    if (_activatedPackages == null) {
      _activatedPackages = new Set();
      _activatedPackages.addAll(list().map((app) => app.packageName));
    }
  }
}

/// A Dart command-line application, installed via `pub global activate`.
abstract class PubApp {
  final String packageName;

  PubApp._(this.packageName);

  /// Create a new reference to a pub application; [packageName] is the same as the
  /// package name.
  factory PubApp.global(String packageName) => new _PubGlobalApp(packageName);

  /// Create a new reference to a pub application; [packageName] is the same as the
  /// package name.
  factory PubApp.local(String packageName) => new _PubLocalApp(packageName);

  bool get isGlobal;

  bool get isActivated;

  /// Install the application (run `pub global activate`). Setting [force] to
  /// try will force the activation of the package even if it is already
  /// installed.
  void activate({bool force: false});

  /// Run the application. If the application is not installed this command will
  /// first activate it.
  ///
  /// If [script] is provided, the sub-script will be run. So
  /// `new PubApp.global('grinder').run(script: 'init');` will run
  /// `grinder:init`.
  String run(List<String> arguments,
      {String script, RunOptions runOptions, String workingDirectory});

  /// Run the application. If the application is not installed this command will
  /// first activate it.
  ///
  /// If [script] is provided, the sub-script will be run. So
  /// `new PubApp.global('grinder').runAsync(script: 'init');` will run
  /// `grinder:init`.
  Future<String> runAsync(List<String> arguments,
      {String script, RunOptions runOptions});

  String toString() => packageName;
}

/// Parse the version out of strings like:
///
///     dart_coveralls 0.1.11
///     pub_cache 0.0.1 at path "/Users/foobar/projects/pub_cache"
String _parseVersion(String output) {
  List<String> tokens = output.split(' ');
  return tokens.length < 2 ? null : tokens[1];
}

class _PubGlobalApp extends PubApp {
  _PubGlobalApp(String packageName) : super._(packageName);

  bool get isGlobal => true;

  bool get isActivated => Pub.global.isActivated(packageName);

  void activate({bool force: false}) =>
      Pub.global.activate(packageName, force: force);

  String run(List<String> arguments,
      {String script, RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    activate();

    return Pub.global.run(packageName,
        script: script, arguments: arguments, runOptions: runOptions);
  }

  Future<String> runAsync(List<String> arguments,
      {String script, RunOptions runOptions}) {
    activate();

    return Pub.global.runAsync(packageName,
        script: script, arguments: arguments, runOptions: runOptions);
  }
}

class _PubLocalApp extends PubApp {
  _PubLocalApp(String packageName) : super._(packageName);

  bool get isGlobal => false;

  // TODO: Implement: call a `Pub.isActivated/Pub.isInstalled`.
  bool get isActivated => throw new UnsupportedError('unimplemented');

  void activate({bool force: false}) {}

  String run(List<String> arguments,
      {String script, RunOptions runOptions, String workingDirectory}) {
    runOptions = mergeWorkingDirectory(workingDirectory, runOptions);
    return Pub.run(packageName,
        script: script, arguments: arguments, runOptions: runOptions);
  }

  Future<String> runAsync(List<String> arguments,
      {String script, RunOptions runOptions}) {
    return Pub.runAsync(packageName,
        script: script, arguments: arguments, runOptions: runOptions);
  }
}
