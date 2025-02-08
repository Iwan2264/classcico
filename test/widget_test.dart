import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:classico/main.dart'; // Import your app's main file

void main() {
  testWidgets('Budget Planner App Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(BudgetPlannerApp());

    // Verify that the initial remaining budget is $0.00.
    expect(find.text('Remaining Budget: \$0.00'), findsOneWidget);

    // Add Income
    await tester.enterText(find.byType(TextField).at(0), '100'); // Income field
    await tester.tap(find.text('Add Income'));
    await tester.pump(); // Wait for the UI to update

    // Verify that the remaining budget is updated to $100.00.
    expect(find.text('Remaining Budget: \$100.00'), findsOneWidget);

    // Add Expense
    await tester.enterText(find.byType(TextField).at(0), '50'); // Expense field
    await tester.enterText(find.byType(TextField).at(1), 'Groceries'); // Description field
    await tester.tap(find.text('Add Expense'));
    await tester.pump(); // Wait for the UI to update

    // Verify that the remaining budget is updated to $50.00.
    expect(find.text('Remaining Budget: \$50.00'), findsOneWidget);

    // Verify that the transaction history is updated.
    expect(find.text('Income: +\$100'), findsOneWidget);
    expect(find.text('Expense: -\$50 (Groceries)'), findsOneWidget);
  });
}