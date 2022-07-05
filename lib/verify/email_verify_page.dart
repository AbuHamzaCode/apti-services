import 'package:apti_service/services/register_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.email, required this.attemptId})
      : super(key: key);
  final String email;
  final String attemptId;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController ftController;
  late TextEditingController scController;
  late TextEditingController tdController;
  late TextEditingController fvController;
  late TextEditingController textEditingController;
  bool isButtonActive = false;
  bool isValid = true;
  late String code;
  final formKey = GlobalKey<FormState>();
  var response;

  @override
  void initState() {
    super.initState();
    ftController = TextEditingController();
    scController = TextEditingController();
    tdController = TextEditingController();
    fvController = TextEditingController();
    textEditingController = TextEditingController();
    textEditingController.addListener(() {
      final isButtonActive = textEditingController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Example verify code')),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 18,
            ),
            child: SizedBox(
                width: 380,
                height: 310,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'E-posta edresini doğurla',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Lütfen e-posta edresinisadsadsadsadsad sdsa dsadd asdsa das dsad ',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            ' (${widget.email}) ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            ' E-posta adresini degishtir',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 17.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 9,
                              ),
                              width: 50,
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        isValid ? Colors.black12 : Colors.red),
                                color: Colors.black12,
                              ),
                              child: TextField(
                                controller: ftController,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 9,
                              ),
                              width: 50,
                              height: 49,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: isValid
                                          ? Colors.black12
                                          : Colors.red),
                                  color: Colors.black12),
                              child: TextField(
                                controller: scController,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 9,
                              ),
                              width: 50,
                              height: 49,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: isValid
                                          ? Colors.black12
                                          : Colors.red),
                                  color: Colors.black12),
                              child: TextField(
                                controller: tdController,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 9,
                              ),
                              width: 50,
                              height: 49,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: isValid
                                          ? Colors.black12
                                          : Colors.red),
                                  color: Colors.black12),
                              child: TextField(
                                controller: fvController,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 9,
                              ),
                              width: 50,
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        isValid ? Colors.black12 : Colors.red),
                                color: Colors.black12,
                              ),
                              child: TextField(
                                controller: textEditingController,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                ],
                              ),
                            ),
                          ]),
                      if (!this.isValid)
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Doğrulama kodu hatalı. Lütfen tekrar deneyiniz.',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      !this.isValid
                          ? const SizedBox(
                              height: 38,
                            )
                          : const SizedBox(
                              height: 35,
                            ),
                      Text(
                        'Doğurlama kodunu yaniden gönder',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 19.0,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Container(
            width: 380,
            height: 50,
            margin: const EdgeInsets.only(
              top: 20,
              left: 18,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onSurface: Colors.blueAccent,
              ),
              onPressed: this.isButtonActive
                  ? () {
                      code = ftController.text +
                          scController.text +
                          tdController.text +
                          fvController.text +
                          textEditingController.text;
                      const Duration(seconds: 2);
                      debugPrint(code);
                      response = RegisterApi.verifyEmailVerificationCode(
                          attemptId: widget.attemptId, code: code);
                      const Duration(milliseconds: 400);
                      setState(() => this.isValid = false);
                    }
                  : null,
              child: Text(
                'Doğrula',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
