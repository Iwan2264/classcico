import 'package:flutter/material.dart';

void main() {
  runApp(BudgetPlannerApp());
}

class BudgetPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: BudgetPlannerHome(),
    );
  }
}

class BudgetPlannerHome extends StatefulWidget {
  @override
  _BudgetPlannerHomeState createState() => _BudgetPlannerHomeState();
}

class _BudgetPlannerHomeState extends State<BudgetPlannerHome> {
  double totalIncome = 0.0;
  double totalExpenses = 0.0;
  List<String> transactions = [];

  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _addIncome() {
    double income = double.tryParse(_incomeController.text) ?? 0.0;
    if (income > 0) {
      setState(() {
        totalIncome += income;
        transactions.add('Income: +\$$income');
      });
      _incomeController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Income added successfully!')),
      );
    }
  }

  void _addExpense() {
    double expense = double.tryParse(_expenseController.text) ?? 0.0;
    if (expense > 0) {
      setState(() {
        totalExpenses += expense;
        transactions.add('Expense: -\$$expense (${_descriptionController.text})');
      });
      _expenseController.clear();
      _descriptionController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Expense added successfully!')),
      );
    }
  }

  double getRemainingBudget() {
    return totalIncome - totalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Planner'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Remaining Budget Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Remaining Budget',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$${getRemainingBudget().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: getRemainingBudget() >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Add Income Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Add Income',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _incomeController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money, color: Colors.green),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _addIncome,
                      icon: Icon(Icons.add),
                      label: Text('Add Income'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Add Expense Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Add Expense',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _expenseController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money, color: Colors.red),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.description, color: Colors.red),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: _addExpense,
                      icon: Icon(Icons.remove),
                      label: Text('Add Expense'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Transaction History
            Text(
              'Transaction History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(transactions[index]),
                    leading: Icon(
                      transactions[index].startsWith('Income') ? Icons.arrow_upward : Icons.arrow_downward,
                      color: transactions[index].startsWith('Income') ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}