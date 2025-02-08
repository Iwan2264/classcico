import 'package:flutter/material.dart';

class RealTimeClock extends StatefulWidget {
  @override
  _RealTimeClockState createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  String currentTime = '';
  String currentDate = '';

  @override
  void initState() {
    super.initState();
    updateTime();
  }

  void updateTime() {
    setState(() {
      currentTime = DateTime.now().toString().split(' ')[1].substring(0, 8);
      currentDate = DateTime.now().toString().split(' ')[0];
    });
    Future.delayed(Duration(seconds: 1), updateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current Time: $currentTime'),
        Text('Current Date: $currentDate'),
      ],
    );
  }
}