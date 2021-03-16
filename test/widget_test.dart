// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stablemanager/main.dart';
import 'package:stablemanager/theme/theme.dart';

void main() {
  testWidgets('MyApp should exist', (WidgetTester tester) async {
    final widget = MyApp();

    await tester.pumpWidget(widget);

    final widgetPredicate = (Widget widget) =>
        widget is MaterialApp &&
        // widget.title == "CoronaOnFire" &&
        widget.theme == AppTheme.light();

    expect(find.byWidgetPredicate(widgetPredicate), findsOneWidget);
  });

}
