// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:werewolves/main.dart';

void main() {
  testWidgets('Werewolf App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Expected Text
    expect(find.text('Werewolves App'), findsOneWidget);

    //Expected Widgets
    expect(find.byKey(const Key("main_MaterialApp")), findsOneWidget);
    expect(find.byKey(const Key("main_Scaffold")), findsOneWidget);
    expect(find.byKey(const Key("main_AppBar")), findsOneWidget);

    //Things that should not be here
    expect(find.text('1'), findsNothing);
  });
}
