

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Basic widget test', (WidgetTester tester) async {
    // Build a simple widget for testing
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: Center(child: Text('Test Widget'))),
      ),
    );

    // Verify that our widget shows the expected text
    expect(find.text('Test Widget'), findsOneWidget);
  });
}
