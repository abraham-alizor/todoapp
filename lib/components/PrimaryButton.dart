import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  Function()? onPressed;
  final String ButtonName;

  PrimaryButton({super.key, required this.onPressed, required this.ButtonName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Text(ButtonName),
        color: Colors.yellow[700],
        elevation: 0,
        textColor: Colors.white);
  }
}
