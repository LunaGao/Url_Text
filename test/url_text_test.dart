import 'package:flutter_test/flutter_test.dart';

import 'package:url_text/url_text.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(UrlText('asadfadsfwwwasdfasdf'));

    expect(find.text('asadfadsf'), findsOneWidget);
  });
}
