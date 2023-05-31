import 'package:flutter/material.dart';
import 'package:holdam_mobile/constants.dart';
import 'package:holdam_mobile/widget/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holdam App Testing.',

      home: Scaffold(
          appBar: AppBar(
            title: const Text('mi app'),
          ),
          body: const Center(
            child: MyTimer(key: timerKey)
            )
          ),
    );
  }
}
