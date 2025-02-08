import 'package:flutter/material.dart';
import '../widgets/utilities_breakdown_card.dart';

class UtilitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Utilities Breakdown')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UtilitiesBreakdownCard(),
      ),
    );
  }
}