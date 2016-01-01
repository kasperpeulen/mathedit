import 'package:git/git.dart';
import 'package:grinder/grinder.dart';
import 'package:grinder/src/utils.dart';

void main(List<String> args) {
  grind(args);
}

@Task()
void analyze() {
  Analyzer
      .analyze(findDartSourceFiles(['web', 'lib', 'test', 'tool']).toList());
}

@Task('Gather and send coverage data')
void coverage() {
  // run coverage locally
  Pub.global.run('dart_dev', arguments: ['coverage']);
}

@Task('Apply dartfmt to all Dart source files')
void format() {
  DartFmt.format(existingSourceDirs);
}

@Task()
void peanut() {
  Pub.global.run('peanut');
  runGit(['push', 'origin', 'gh-pages']);
}

@DefaultTask()
@Depends(analyze, format, peanut)
void prepush() {}

@Task()
void test() {
  final platforms = ['vm,firefox,content-shell'];
  new TestRunner().test(platformSelector: platforms);
}

@Task('Test dartfmt for all Dart source files')
void testdartfmt() {
  if (DartFmt.dryRun(existingSourceDirs)) {
    throw "dartfmt failure";
  }
}

@Task()
@Depends(analyze, testdartfmt, test)
void travis() {}
