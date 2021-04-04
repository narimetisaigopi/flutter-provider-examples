import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'timer_provider.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  // int countDown = 1144;

  @override
  void initState() {
    var timerProvider = Provider.of<TimerProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      timerProvider.updateTimer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("build ....");
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Icon(
              Icons.timer,
              size: 80,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                child: Consumer<TimerProvider>(
                  builder: (context, data, child) {
                    return Text(
                      "${data.countDown}",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
