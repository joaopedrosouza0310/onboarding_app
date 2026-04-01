import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_app/features/onboarding/presentation/widgets/name_step.dart';

void main() {
  group('NameStep', () {
    Widget buildSubject({
      String initialName = '',
      void Function(String)? onNameChanged,
      VoidCallback? onNext,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: NameStep(
              initialName: initialName,
              onNameChanged: onNameChanged ?? (_) {},
              onNext: onNext ?? () {},
            ),
          ),
        ),
      );
    }

    testWidgets('renders label and continue button', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.text('Full legal name'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('shows error when name is empty on submit', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your full name.'), findsOneWidget);
    });

    testWidgets('does not call onNext for an empty name', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onNext: () => called = true));

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(called, false);
    });

    testWidgets('calls onNext when a valid name is entered', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onNext: () => called = true));

      await tester.enterText(find.byType(TextFormField), 'María García');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(called, true);
    });

    testWidgets('accepts mononym (single word name)', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onNext: () => called = true));

      await tester.enterText(find.byType(TextFormField), 'Cher');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(called, true);
    });

    testWidgets('accepts hyphenated name', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onNext: () => called = true));

      await tester.enterText(find.byType(TextFormField), 'Anne-Marie O\'Brien');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(called, true);
    });

    testWidgets('accepts name with diacritics', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onNext: () => called = true));

      await tester.enterText(find.byType(TextFormField), 'Sören Müller-Böhm');
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(called, true);
    });

    testWidgets('shows error when name exceeds 150 characters', (tester) async {
      // Provide the oversized name via initialName so the controller is
      // seeded directly, bypassing the maxLength input formatter.
      await tester.pumpWidget(buildSubject(initialName: 'A' * 151));

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(
        find.text('Name must be 150 characters or fewer.'),
        findsOneWidget,
      );
    });

    testWidgets('propagates name via onNameChanged callback', (tester) async {
      String? captured;
      await tester.pumpWidget(buildSubject(onNameChanged: (v) => captured = v));

      await tester.enterText(find.byType(TextFormField), 'João Pedro');
      await tester.pump();

      expect(captured, 'João Pedro');
    });

    testWidgets('pre-populates field with initialName', (tester) async {
      await tester.pumpWidget(buildSubject(initialName: 'Existing Name'));

      expect(find.text('Existing Name'), findsOneWidget);
    });
  });
}
