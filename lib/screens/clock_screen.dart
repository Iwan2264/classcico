import 'package:flutter/material.dart';
import '../widgets/real_time_clock.dart';

class ClockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Real-Time Clock')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RealTimeClock(),
      ),
    );
  }
}