import 'package:flutter/material.dart';
import '../widgets/daily_expense_form.dart';

class DailyExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily Expense Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DailyExpenseForm(),
      ),
    );
  }
}