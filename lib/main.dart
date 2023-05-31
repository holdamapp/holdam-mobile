import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:holdam_mobile/constants.dart';
import 'package:holdam_mobile/widget/timer.dart';
import 'package:holdam_mobile/widget/coupon_list.dart';
import 'package:holdam_mobile/widget/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holdam App',
      home: const SignInScreen(),
    );
  }
}
