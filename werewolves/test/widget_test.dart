import 'package:flutter_test/flutter_test.dart';

import 'package:werewolves/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that our sign in button exist.
    expect(find.text('Sign In'), findsOneWidget);
  });
}
