import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyContainer extends StatefulWidget {
  const VerifyContainer({Key? key, required this.isValid, required this.buttonVisible}) : super(key: key);
  final bool isValid;
  final bool buttonVisible;

  @override
  State<VerifyContainer> createState() => _VerifyContainerState();
}

class _VerifyContainerState extends State<VerifyContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 9,
      ),
      width: 50,
      height: 49,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: widget.isValid ? Colors.black12 : Colors.red),
          color: Colors.black12),
      child: TextField(
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
    );
  }
}
