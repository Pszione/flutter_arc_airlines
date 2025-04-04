import 'package:flutter_arc_airlines/features/home/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  Widget buildWidget(CustomChip child) => MaterialApp(home: Scaffold(body: child));

  group('CustomChip', () {
    testWidgets('displays text with default padding', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(const CustomChip(text: 'Test Chip')));

      final chipFinder = find.text('Test Chip');
      expect(chipFinder, findsOneWidget);
    });

    testWidgets('displays text with custom color', (WidgetTester tester) async {
      final value = Colors.red;
      await tester.pumpWidget(buildWidget(CustomChip(text: 'Test Chip', color: value)));

      final chipFinder = find.descendant(
        of: find.byElementType(CustomChip),
        matching: find.byType(Material),
      );
      final material = tester.widget<Material>(chipFinder);
      expect(material.color, value);
    });

    testWidgets('displays text with custom text color', (WidgetTester tester) async {
      final value = Colors.blue;
      await tester.pumpWidget(buildWidget(CustomChip(text: 'Test Chip', textColor: value)));

      final textFinder = find.text('Test Chip');
      final text = tester.widget<Text>(textFinder);
      expect(text.style?.color, value);
    });

    testWidgets('displays text with custom padding', (WidgetTester tester) async {
      final value = 16.0;
      await tester.pumpWidget(
        buildWidget(CustomChip(text: 'Test Chip', padding: EdgeInsets.all(value))),
      );

      final paddingFinder = find.byType(Padding);
      final padding = tester.widget<Padding>(paddingFinder);
      expect(padding.padding, EdgeInsets.all(value));
    });

    testWidgets('displays text with padding multiplier', (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget(CustomChip(text: 'Test Chip', paddingMultiplier: 2.0)));

      final paddingFinder = find.byType(Padding);
      final padding = tester.widget<Padding>(paddingFinder);
      expect(padding.padding, EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0));
    });

    testWidgets('throws assertion error when both padding and paddingMultiplier are provided', (
      WidgetTester tester,
    ) async {
      expect(
        () => CustomChip(text: 'Test Chip', padding: EdgeInsets.zero, paddingMultiplier: 2.0),
        throwsAssertionError,
      );
    });

    testWidgets('throws assertion error when paddingMultiplier is non-positive', (
      WidgetTester tester,
    ) async {
      expect(() => CustomChip(text: 'Test Chip', paddingMultiplier: 0), throwsAssertionError);
    });
  });
}
