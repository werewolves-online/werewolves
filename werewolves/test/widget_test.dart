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
