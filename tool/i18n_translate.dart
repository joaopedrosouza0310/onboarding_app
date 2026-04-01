// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const basePath = 'lib/l10n';
const rootLocale = 'en';
const otherLocales = ['es', 'ru', 'de'];

File arbFile(String locale) => File('$basePath/intl_$locale.arb');

Future<Map<String, dynamic>> readArb(File file) async {
  if (!await file.exists()) {
    return {};
  }
  final content = await file.readAsString();
  return json.decode(content) as Map<String, dynamic>;
}

String claudify(String text) => '[CLAUDE] $text';

Future<void> main(List<String> args) async {
  final en = await readArb(arbFile(rootLocale));
  if (!en.containsKey('@@locale')) {
    stderr.writeln(
      'ERROR: file $basePath/intl_$rootLocale.arb appears invalid.',
    );
    exit(1);
  }

  bool fillMissing = args.contains('--fill');
  bool tryClaude = args.contains('--claude');

  for (final locale in otherLocales) {
    final file = arbFile(locale);
    final arb = await readArb(file);
    final missing = <String>[];

    for (final k in en.keys) {
      if (k.startsWith('@')) continue;
      if (!arb.containsKey(k)) {
        missing.add(k);
      }
    }

    if (missing.isEmpty) {
      print('✓ $locale is already 100% up to date.');
      continue;
    }

    print('⚠️ $locale missing ${missing.length} keys: ${missing.join(', ')}');

    if (fillMissing || tryClaude) {
      for (final key in missing) {
        final enValue = en[key] as String? ?? '';
        final translation = tryClaude
            ? claudify(enValue)
            : '__TRANSLATE_ME__ $enValue';
        arb[key] = translation;
      }
      await file.writeAsString(
        '${const JsonEncoder.withIndent('  ').convert(arb)}\n',
      );
      print('  * Updated $locale with placeholders for missing keys.');
    }
  }

  print('\nUse:');
  print('  dart run tool/i18n_translate.dart         # list missing keys');
  print('  dart run tool/i18n_translate.dart --fill  # add placeholders');
  print(
    '  dart run tool/i18n_translate.dart --claude # add CLAUDE markers (configure API key manually)',
  );
}
