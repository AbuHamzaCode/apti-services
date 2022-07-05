import 'package:apti_service/verify/email_verify_page.dart';
import 'package:flutter/material.dart';

import 'onboarding/onboarding_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(email: 'email.@gmial.com',attemptId: "sdsd13322343243dfss231123dwddd",),
    );
  }
}
