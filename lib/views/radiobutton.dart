import 'package:flutter/material.dart';

final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});
  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String selectedOption = options.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: selectedOption,
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ); // RadioListTile
          }).toList(),
        ), // Column
      ), // Center
    ); // Scaffold
  }
}
