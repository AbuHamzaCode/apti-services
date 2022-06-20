import 'package:flutter/material.dart';

import '../services/login_api.dart';


class VerifyPage extends StatefulWidget {
  final dynamic attemptId;
  const VerifyPage({Key? key, @required this.attemptId}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {

  // final Api service = Api();
  dynamic verifyCode;
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
                child: const Text(
                  'Code Verify Page',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Code',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Email Verify'),
                  onPressed: () {
                  },
                )
            ),
          ],
        ),
    );
  }
}
