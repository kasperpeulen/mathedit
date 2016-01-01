import 'package:git/git.dart';
import 'package:grinder/grinder.dart';
import 'package:grinder/src/utils.dart';
import 'package:github/server.dart';
import 'dart:io';
import 'dart:async';

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
Future peanut() async {
  await Pub.global.run('peanut');
  await runGit(['push', 'origin', 'gh-pages']);
}

@DefaultTask()
@Depends(analyze, format, peanut)
void prePush() {}

@Task()
void test() {
  final platforms = ['vm,firefox,content-shell'];
  new TestRunner().test(platformSelector: platforms);
}

@Task('Test dartfmt for all Dart source files')
void testDartFormat() {
  if (DartFmt.dryRun(existingSourceDirs)) {
    throw "dartfmt failure";
  }
}

@Task()
@Depends(analyze, testDartFormat, test)
void travis() {}

@Task()
Future deleteGists() async {
  final password = Process.runSync(
      'security', ['find-internet-password', '-w', '-s', 'github.com']);
  final authentication = new Authentication.basic(
      'kasperpeulen', password.stdout.toString().trim());
  final github = createGitHubClient(auth: authentication);
  var noGistsToDelete = true;
  await github.gists.listCurrentUserGists().listen((g) {
    if (g.files.first.name == 'mathedit.md') {
      github.gists.deleteGist(g.id);
      print('Deleted gist ${g.id}');
      noGistsToDelete = false;
    }
  }).asFuture();
  if (noGistsToDelete) print('No gists to delete');
  exit(0);
}
