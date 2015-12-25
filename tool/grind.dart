import 'package:grinder/grinder.dart';

void main(List<String> args) {
  grind(args);
}

@DefaultTask()
@Depends(format, analyze)
void prepush() {}

@Depends(testFormat, analyze)
@Task()
void travis() {}

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
