import 'package:flutter/material.dart';

class BudgetOverviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Budget Overview', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            // Add your budget overview UI here
          ],
        ),
      ),
    );
  }
}