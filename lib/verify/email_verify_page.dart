import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _onEditing = true;
  late String _code;
  late String email;

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
              top: 10,
              left: 50,
            ),
            child: SizedBox(
                width: 300,
                height: 290,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'E-posta edresini doğurla',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Lütfen e-posta edresinisadsadsadsadsad sdsa dsadd asdsa das dsad ',
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        children: [
                          Text(
                            '(email.@gmail.com) ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'E-posta adresini degishtir',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          )
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Center(
          //     child: Text(
          //       'Enter your code',
          //       style: TextStyle(fontSize: 20.0),
          //     ),
          //   ),
          // ),
          // VerificationCode(
          //   textStyle: Theme.of(context)
          //       .textTheme
          //       .bodyText2!
          //       .copyWith(color: Theme.of(context).primaryColor),
          //   keyboardType: TextInputType.number,
          //   underlineColor: Colors.amber,
          //   // If this is null it will use primaryColor: Colors.red from Theme
          //   length: 4,
          //   cursorColor: Colors.blue,
          //   // If this is null it will default to the ambient
          //   // clearAll is NOT required, you can delete it
          //   // takes any widget, so you can implement your design
          //   clearAll: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       'clear all',
          //       style: TextStyle(
          //           fontSize: 14.0,
          //           decoration: TextDecoration.underline,
          //           color: Colors.blue[700]),
          //     ),
          //   ),
          //   onCompleted: (String value) {
          //     setState(() {
          //       _code = value;
          //     });
          //   },
          //   onEditing: (bool value) {
          //     setState(() {
          //       _onEditing = value;
          //     });
          //     if (!_onEditing) FocusScope.of(context).unfocus();
          //   },
          // ),
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Center(
          //     child: _onEditing
          //         ? Text('Please enter full code')
          //         : Text('Your code: $_code'),
          //   ),
          // )
        ],
      ),
    );
  }
}
