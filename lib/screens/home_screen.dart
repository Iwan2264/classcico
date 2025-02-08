import 'package:flutter/material.dart';
import 'budget_overview_screen.dart';
import 'daily_expense_screen.dart';
import 'utilities_screen.dart';
import 'clock_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Classico Budget Planner'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Daily'),
              Tab(text: 'Utilities'),
              Tab(text: 'Clock'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BudgetOverviewScreen(),
            DailyExpenseScreen(),
            UtilitiesScreen(),
            ClockScreen(),
          ],
        ),
      ),
    );
  }
}