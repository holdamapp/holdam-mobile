import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holdam_mobile/widget/signin.dart';
import 'package:holdam_mobile/widget/timer.dart';
import 'package:holdam_mobile/constants.dart';

class _CouponsListState extends State<CouponsList> {

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
        title: const Text('Coupon list'),
        actions: <Widget>[
          TextButton( //TODO Refactor. Code repeated
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
                      navigate_to(const MyTimer());
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
