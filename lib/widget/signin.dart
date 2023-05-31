import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holdam_mobile/reusable_widgets/signin_signup_button.dart';
import 'package:holdam_mobile/utils/color_utils.dart';
import 'package:holdam_mobile/widget/signup.dart';

import '../reusable_widgets/logo_widget.dart';
import '../reusable_widgets/text_field.dart';
import 'coupon_list.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> { //TODO Add animations and validations
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
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/Holdam_marca-11.png"),
                SizedBox(
                  height: 30,
                ),
                textField("Enter username", Icons.person_outline, false, _emailTextController),
                SizedBox(
                  height: 20,
                ),
                textField("Enter password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                  ).then(
                          (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => CouponsList()))
                  ).onError(
                          (error, stackTrace) => print("Error ${error.toString()}"));

                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      )
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        )
      ],
    );
  }

}
