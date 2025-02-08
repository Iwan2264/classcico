import 'package:flutter/material.dart';

class UtilitiesBreakdownCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Utilities Breakdown', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            // Add your utilities breakdown UI here
          ],
        ),
      ),
    );
  }
}