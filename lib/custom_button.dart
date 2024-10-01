// import 'package:flutter/material.dart';
// import 'styles.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const CustomButton({super.key, required this.text, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ButtonStyle(
//         backgroundColor: WidgetStateProperty.all(AppStyles.primaryColor),
//       ),
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   }
// }
// // 
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        backgroundColor: Colors.blue,
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 18)),
    );
  }
}
