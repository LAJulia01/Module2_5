// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData icon;
//   final VoidCallback onTap;

//   const CustomTextField({super.key, 
//     required this.controller,
//     required this.labelText,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: 'Select $labelText',
//         suffixIcon: Icon(icon),
//       ),
//       readOnly: true, // To make sure the field is not editable
//       onTap: onTap, // On tap event to open date/time picker
//     );
//   }
// }
// //
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final VoidCallback onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Select $labelText',
        suffixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      readOnly: true, // Makes the text field read-only
      onTap: onTap, // The callback for opening the picker (date/time)
    );
  }
}
