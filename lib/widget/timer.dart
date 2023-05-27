// ignore_for_file: invalid_visibility_annotation, avoid_print

import 'dart:async';

import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        MainAxisAlignment,
        Row,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget,
        visibleForTesting;

import 'package:holdam_mobile/widget/buttons.dart'
    show resetButton, startButton;

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => MyTimerState();
}

@visibleForTesting
class MyTimerState extends State<MyTimer> {
  int initialtValue = 300;
  int timerValue = 300;
  bool isStarted = false;
  int focusedMinites = 0;

  void startTimer() {
    if (!isStarted) {
      isStarted = true;
      launchTimer();
    }
  }

  void launchTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isStarted) {
        decrementTimerValue();
      } else {
        timer.cancel();
      }
    });
  }

  void decrementTimerValue() {
    setState(() {
      if (isStarted) {
        timerValue--;
      }
    });
  }

  void resetTimer() {
    setState(() {
      timerValue = initialtValue;
      isStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$timerValue',
          style: const TextStyle(fontSize: 50),
        ),
        const SizedBox(
          height: 50, //<-- SEE HERE
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            startButton(startTimer),
            resetButton(resetTimer),
          ],
        )
      ],
    );
  }
}
