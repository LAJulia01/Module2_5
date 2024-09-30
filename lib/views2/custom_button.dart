import 'package:flutter/material.dart';
import 'styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppStyles.primaryColor),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
