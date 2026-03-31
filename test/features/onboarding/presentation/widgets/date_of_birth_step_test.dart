import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding_app/features/onboarding/presentation/widgets/date_of_birth_step.dart';

void main() {
  group('DateOfBirthStep', () {
    Widget buildSubject({
      DateTime? initialDob,
      void Function(DateTime)? onDobChanged,
      VoidCallback? onNext,
      VoidCallback? onBack,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: DateOfBirthStep(
              initialDob: initialDob,
              onDobChanged: onDobChanged ?? (_) {},
              onNext: onNext ?? () {},
              onBack: onBack ?? () {},
            ),
          ),
        ),
      );
    }

    testWidgets('renders picker field and navigation buttons', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.text('Date of birth'), findsOneWidget);
      expect(find.text('Continue'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });

    testWidgets('shows error when no date selected and Next is tapped',
        (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(
        find.text('Please select your date of birth.'),
        findsOneWidget,
      );
    });

    testWidgets('does not call onNext when no date is selected', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onNext: () => called = true));

      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(called, false);
    });

    testWidgets('calls onBack when Back is tapped', (tester) async {
      var called = false;
      await tester.pumpWidget(buildSubject(onBack: () => called = true));

      await tester.tap(find.text('Back'));
      await tester.pump();

      expect(called, true);
    });

    testWidgets('displays formatted date when initialDob is provided',
        (tester) async {
      await tester.pumpWidget(
        buildSubject(initialDob: DateTime(1990, 5, 15)),
      );

      expect(find.text('May 15, 1990'), findsOneWidget);
    });

    testWidgets('shows age when a valid date is pre-populated', (tester) async {
      final dob = DateTime(
        DateTime.now().year - 30,
        DateTime.now().month,
        DateTime.now().day,
      );
      await tester.pumpWidget(buildSubject(initialDob: dob));

      expect(find.textContaining('Age:'), findsOneWidget);
    });
  });
}
