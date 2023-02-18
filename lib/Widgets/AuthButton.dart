import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final String? buttonImage;
  const AuthButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.onPressed,
      required this.buttonImage,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor, elevation: 2),
        onPressed: onPressed,
        child: Row(children: [
          SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(buttonImage.toString())),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              buttonText.toString(),
              style: TextStyle(
                  color: textColor, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ]),
      ),
    );
  }
}
