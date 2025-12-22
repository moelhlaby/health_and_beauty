import 'dart:io';

void main() async {
  // Replace this with reading from an actual file if needed
  final xmlContent = await File('assets/source.xliff').readAsString();

  // RegExp to match <source>...</source>
  final regex = RegExp(r'<source>(.*?)<\/source>', dotAll: true);
  final matches = regex.allMatches(xmlContent);

  // Extract and clean the values
  final sourceStrings = matches.map((match) => match.group(1)!.trim()).toList();

  // Convert to Dart code string
  final dartCode =
      '''
// This file is generated. Do not edit manually.
const List<String> sourceStrings = [
  ${sourceStrings.map((s) => '"$s"').join(',\n  ')}
];
''';

  // Write the result to a Dart file
  final outputPath = 'source_strings.dart';
  final outputFile = File(outputPath);
  await outputFile.create(recursive: true);
  await outputFile.writeAsString(dartCode);

  print(
    '✅ source_strings.dart generated successfully with ${sourceStrings.length} entries.',
  );
}
