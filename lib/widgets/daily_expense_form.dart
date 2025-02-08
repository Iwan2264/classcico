import 'package:flutter/material.dart';

class DailyExpenseForm extends StatefulWidget {
  @override
  _DailyExpenseFormState createState() => _DailyExpenseFormState();
}

class _DailyExpenseFormState extends State<DailyExpenseForm> {
  final Map<String, double> expenses = {
    'Milk/Dairy': 0,
    'Food': 0,
    'Drink': 0,
    'Travel': 0,
    'Other': 0,
  };
  String remarks = '';

  double getTotalSpent() {
    return expenses.values.reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...expenses.keys.map((category) {
          return TextField(
            decoration: InputDecoration(labelText: category),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                expenses[category] = double.tryParse(value) ?? 0;
              });
            },
          );
        }).toList(),
        TextField(
          decoration: InputDecoration(labelText: 'Remarks'),
          onChanged: (value) {
            setState(() {
              remarks = value;
            });
          },
        ),
        SizedBox(height: 20),
        Text('Total Spent: ₹${getTotalSpent()}'),
        Text('Remarks: $remarks'),
      ],
    );
  }
}