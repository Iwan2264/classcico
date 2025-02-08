import 'package:flutter/material.dart';
import '../widgets/budget_overview_card.dart'; // Correct import path

class BudgetOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Budget Overview')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BudgetOverviewCard(), // Use the widget here
      ),
    );
  }
}