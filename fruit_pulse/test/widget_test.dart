import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_pulse/features/fruit_selection/presentation/fruit_selection_screen.dart';

void main() {
  testWidgets('shows fruit selection screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FruitSelectionScreen()));

    expect(find.text('Select a fruit to analyze'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);
  });
}
