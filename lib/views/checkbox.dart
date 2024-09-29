import 'package:flutter/material.dart';

final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

List<bool> isChecked = [false, false, false];

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  String selectedOption = options.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
                title: Text(options[index]),
                value: isChecked[index],
                onChanged: (bool? value) {
                  setState(() {
                    isChecked[index] = value ?? false;
                  });
                });
          }),
    ])));
  }
} // ListView.builder