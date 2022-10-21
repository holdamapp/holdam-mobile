import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:holdam_mobile/constants.dart'
    show resetButtonKey, startButtonKey, timerKey;

import 'package:holdam_mobile/main.dart';
import 'package:holdam_mobile/widget/timer.dart';

void main() {
  testWidgets('myTimer exist inside my App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    final timer = find.byType(MyTimer);
    expect(timer, findsOneWidget);
  });

  test(
      'when the decrementTimer is called the timer value should drecease by one',
      () {
    final timer = const MyTimer().createElement();
    final timerState = timer.state as MyTimerState;
    timerState.timerValue = 300;
    timerState.isStarted = true;
    timerState.decrementTimerValue();
    expect(timerState.timerValue, 299);
  });

  test("The timer only decremetns only if it have been started before", () {
    final timer = const MyTimer().createElement();
    final timerState = timer.state as MyTimerState;
    timerState.timerValue = 300;
    timerState.decrementTimerValue();
    expect(timerState.timerValue, 300);
  });

  test(
      'the timer should become the initial one  when the resetTimerValue is called ',
      () {
    final timer = const MyTimer().createElement();
    final timerState = timer.state as MyTimerState;
    timerState.resetTimer();
    expect(timerState.timerValue, timerState.initialtValue);
  });

  test('the Timer.periodic should be cancel after call resetTimerValue', () {
    final timer = const MyTimer().createElement();
    final timerState = timer.state as MyTimerState;
    timerState.resetTimer();
    expect(timerState.isStarted, false);
  });

  testWidgets(
      'when MyTimer renders it should have the text and both reset and start buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MyTimer()));
    expect(find.byKey(startButtonKey), findsOneWidget);
    expect(find.byKey(resetButtonKey), findsOneWidget);
  });

  // testWidgets('When you press the RESET button it should return to ',
  //     (WidgetTester tester) async {});

  testWidgets('When you press the START button the starts timer ',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    await tester.pump();

    final MyTimerState state = tester.state(find.byKey(timerKey).first);
    int initialTimerValue = state.timerValue;
    await tester.tap(find.byKey(startButtonKey));
    await tester.pump(const Duration(seconds: 1));

    expect(state.timerValue, initialTimerValue - 1);
    await tester.pump(const Duration(seconds: 2));
    expect(state.timerValue, initialTimerValue - 3);

    await tester.pump(const Duration(seconds: 3));
    expect(state.timerValue, initialTimerValue - 6);

    state.isStarted = false;
    await tester.pump(const Duration(seconds: 2));
  });

  testWidgets('When you press the RESET button the starts timer ',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final MyTimerState state = tester.state(find.byKey(timerKey).first);
    int initialTimerValue = state.timerValue;

    await tester.tap(find.byKey(startButtonKey));
    await tester.pump(const Duration(seconds: 5));
    expect(state.timerValue, initialTimerValue - 5);
    await tester.tap(find.byKey(resetButtonKey).last);
    await tester.pump(const Duration(seconds: 1));
    expect(state.timerValue, initialTimerValue);


    state.isStarted = false;
    await tester.pump(const Duration(seconds: 2));
  });
}
