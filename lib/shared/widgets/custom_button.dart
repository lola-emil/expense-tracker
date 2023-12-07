import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16 * 1.25),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          )),
    );
  }
}
