import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holdam_mobile/widget/coupon_list.dart';

import '../reusable_widgets/logo_widget.dart';
import '../reusable_widgets/signin_signup_button.dart';
import '../reusable_widgets/text_field.dart';
import '../utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> { //TODO Add animations and validations
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/Holdam_marca-11.png"),
                SizedBox(
                  height: 20,
                ),
                textField("Enter username", Icons.person_outline, false, _usernameTextController),
                SizedBox(
                  height: 20,
                ),
                textField("Enter email", Icons.lock_outline, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                textField("Enter password", Icons.person_outline, true, _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                  ).then((value) {
                    print("somethinggggg");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CouponsList()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
              ],
            ),
          ),
        ),
      )
    );
  }
}