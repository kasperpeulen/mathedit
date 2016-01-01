import 'package:git/git.dart';
import 'package:grinder/grinder.dart';
import 'package:grinder/src/utils.dart';
import 'package:github/server.dart';
import 'dart:io';

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

@Task()
void deleteGists() {
  final result = Process
      .runSync('git-credential-osxkeychain', ['get', 'https://github.com']);
  final list = result.stdout.split('\n');
  final cred = list.sublist(0, 2).map((s) => s.substring(s.indexOf('=') + 1));
  final authentication = new Authentication.basic(cred.last, cred.first);
  final github = createGitHubClient(auth: authentication);
  github.gists.listCurrentUserGists().listen((g) {
    if (g.files.first.name == 'mathedit.md') {
      print(g.files.map((g) => g.name));
      github.gists.deleteGist(g.id);
    }
  });
}
