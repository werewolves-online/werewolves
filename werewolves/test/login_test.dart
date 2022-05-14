import 'package:flutter_test/flutter_test.dart';

import 'helpers.dart';

void main() {
  testWidgets('Werewolf App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createAppWithLoginPage());

    // Expected Text
    expect(find.text('Sign in with Google'), findsOneWidget);
    expect(find.text('Hello'), findsOneWidget);
  });
}
