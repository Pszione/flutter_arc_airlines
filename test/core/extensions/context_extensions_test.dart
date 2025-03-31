import 'package:flutter/material.dart';
import 'package:flutter_arc_airlines/core/extensions/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

extension _TestContextExtensions on WidgetTester {
  BuildContext get context => element(find.byType(SizedBox));
}

void main() {
  final testWidget = MaterialApp(
    home: Scaffold(
      body: Builder(builder: (BuildContext context) => SizedBox.shrink()),
    ),
  );

  testWidgets('Should return ThemeData of the current context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.context;

    expect(context.theme, isA<ThemeData>());
  });

  testWidgets('Should return TextTheme of the current context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.context;

    expect(context.textTheme, isA<TextTheme>());
  });

  testWidgets('Should return ColorScheme of the current context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.context;

    expect(context.colorScheme, isA<ColorScheme>());
  });

  testWidgets('Should return MediaQuery size of the current context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.context;

    expect(context.size, isA<Size>());
  });

  testWidgets('Should return screen width of the current context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.context;

    expect(context.screenWidth, isA<double>());
  });

  testWidgets('Should return screen height of the current context', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(testWidget);
    final BuildContext context = tester.context;

    expect(context.screenHeight, isA<double>());
  });
}
