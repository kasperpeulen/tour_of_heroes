import 'package:grinder/grinder.dart';

void main(List<String> args) {
  grind(args);
}

@DefaultTask()
@Depends(format, analyze, peanut)
void prepush() {}

@Depends(testFormat, analyze, build)
@Task()
void travis() {}

@Task()
void build() {
  Pub.build(directories: ['web']);
}

@Task('Peanut should be run before each push, to update the demo in gh-pages.')
void peanut() {
  Pub.global.run('peanut');
}

@Task('Analyze all Dart files.')
void analyze() {
  Analyzer.analyze(existingSourceDirs);
}

@Task('Apply dartfmt to all Dart source files')
void format() {
  DartFmt.format(existingSourceDirs);
}

@Task('Test dartfmt for all Dart source files')
void testFormat() {
  if (DartFmt.dryRun(existingSourceDirs)) {
    throw "Oh noes! Seems like you forget to run dartfmt.";
  }
}
