import 'package:flutter/material.dart';
import 'package:holdam_mobile/widget/timer.dart';

import 'package:holdam_mobile/constants.dart';

class _CouponsListState extends State<CouponsList> {

  void navigate_to_timer_screen(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyTimer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupon list'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: coupons.length,
        itemBuilder: /*1*/ (context, i) {
          return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      coupons[i].name,
                      style: const TextStyle(fontSize: 28),
                    ),
                    onTap: () {
                      navigate_to_timer_screen();
                    },
                    contentPadding: EdgeInsets.all(20.0),
                  ),
              ]
              )
          );
        },
      ),
    );
  }
}

class CouponsList extends StatefulWidget {
  const CouponsList({super.key});

  @override
  State<CouponsList> createState() => _CouponsListState();
}
