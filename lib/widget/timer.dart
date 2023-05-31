// ignore_for_file: invalid_visibility_annotation, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'
    show AppBar, BuildContext, ButtonStyle, Column, MainAxisAlignment, MaterialPageRoute, Navigator, Row, Scaffold, SizedBox, State, StatefulWidget, Text, TextButton, TextStyle, Theme, Widget, visibleForTesting;

import 'package:holdam_mobile/widget/buttons.dart'
    show 
        resetButton, 
        startButton;
import 'package:holdam_mobile/widget/signin.dart';

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

  void navigate_to(screen){ //TODO Refactor. Code repeated
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle logout_button_style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: AppBar(
          title: const Text('Timer'),
          actions: <Widget>[  //TODO Refactor. Code repeated
            TextButton(
              style: logout_button_style,
              onPressed: (){
                FirebaseAuth.instance.signOut().then(
                        (value) => navigate_to(const SignInScreen())
                );
              },
              child: const Text("Sign out"),
          )
        ],
      ),
      body: Column(
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
    ),
    );
  }
}
