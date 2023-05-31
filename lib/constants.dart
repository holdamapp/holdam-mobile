import 'package:flutter/material.dart' 
  show 
    Key;

const startButtonKey = Key('start_button');
const resetButtonKey = Key('reset_button');
const timerKey = Key('timer_widget');

final coupons = <Coupon>[
    Coupon(
        name:'2x1 in something',
        study_time: 'study_time',
        expiration: 'expiration',
    ),
    Coupon(
        name:'3x1 in something else',
        study_time: 'study_time',
        expiration: 'expiration',
    ),
    Coupon(
        name:'3x2 in something else',
        study_time: 'study_timee',
        expiration: 'expiration',
    ),
];
class Coupon {
    final String name;
    final String study_time;
    final String expiration;

    Coupon({required this.name, required this.study_time, required this.expiration});
}
