import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:grinder/src/utils.dart';

void main(List<String> args) {
  grind(args);
}

@DefaultTask()
@Depends(analyze, format, coverage)
void prepush() {}

@Task()
@Depends(analyze, testdartfmt, test)
void travis() {}

@Task()
void analyze() {
  Analyzer
      .analyze(findDartSourceFiles(['web', 'lib', 'test', 'tool']).toList());
}

@Task()
void test() {
  final platforms = ['vm,firefox,content-shell'];
  new TestRunner().test(platformSelector: platforms);
}

@Task('Apply dartfmt to all Dart source files')
void format() {
  DartFmt.format(existingSourceDirs);
}

@Task('Test dartfmt for all Dart source files')
void testdartfmt() {
  if (DartFmt.dryRun(existingSourceDirs)) {
    throw "dartfmt failure";
  }
}

@Task('Gather and send coverage data')
void coverage() {
  // run coverage locally
  Pub.global.run('dart_dev', arguments: ['coverage']);
}
