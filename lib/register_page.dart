import 'package:flutter/material.dart';
// Import the styles
import 'custom_button.dart'; // Import the custom button
import 'custom_textfield.dart'; // Import the custom text field

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers for text fields
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  // Dropdown Gender options
  String dropdownGender = 'Male'; // Default gender

  // Radio button Civil Status options
  String selectedStatus = 'Single'; // Default civil status

  // Checkbox states for subject codes
  bool isMathChecked = false;
  bool isEnglishChecked = false;
  bool isScienceChecked = false;

  // Date for Birthdate
  DateTime selectedDate = DateTime.now();

  // Time for class schedule
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  // Method to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _birthDateController.text = "${picked.toLocal()}".split(' ')[0]; // Format date
      });
    }
  }

  // Method to pick start time
  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (picked != null && picked != startTime) {
      setState(() {
        startTime = picked;
        _startTimeController.text = picked.format(context); // Format time
      });
    }
  }

  // Method to pick end time
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (picked != null && picked != endTime) {
      setState(() {
        endTime = picked;
        _endTimeController.text = picked.format(context); // Format time
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Dropdown for Gender
            DropdownButton<String>(
              value: dropdownGender,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownGender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Radio buttons for Civil Status
            const Text('Civil Status:'),
            RadioListTile<String>(
              title: const Text('Single'),
              value: 'Single',
              groupValue: selectedStatus,
              onChanged: (String? value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Married'),
              value: 'Married',
              groupValue: selectedStatus,
              onChanged: (String? value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Widowed'),
              value: 'Widowed',
              groupValue: selectedStatus,
              onChanged: (String? value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Checkbox for Subject Codes
            const Text('Subjects:'),
            CheckboxListTile(
              title: const Text("Math"),
              value: isMathChecked,
              onChanged: (bool? value) {
                setState(() {
                  isMathChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("English"),
              value: isEnglishChecked,
              onChanged: (bool? value) {
                setState(() {
                  isEnglishChecked = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Science"),
              value: isScienceChecked,
              onChanged: (bool? value) {
                setState(() {
                  isScienceChecked = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Date Picker for Birthdate
            CustomTextField(
              controller: _birthDateController,
              labelText: 'Birthdate',
              icon: Icons.calendar_today,
              onTap: () => _selectDate(context),
            ),

            const SizedBox(height: 20),

            // Time Pickers for Class Schedule
            CustomTextField(
              controller: _startTimeController,
              labelText: 'Class Start Time',
              icon: Icons.access_time,
              onTap: () => _selectStartTime(context),
            ),
            CustomTextField(
              controller: _endTimeController,
              labelText: 'Class End Time',
              icon: Icons.access_time,
              onTap: () => _selectEndTime(context),
            ),

            const SizedBox(height: 20),

            // Submit Button
            CustomButton(
              text: 'Submit',
              onPressed: () {
                // Handle form submission
                ("Gender: $dropdownGender");
                ("Civil Status: $selectedStatus");
                ("Subjects: Math: $isMathChecked, English: $isEnglishChecked, Science: $isScienceChecked");
                ("Birthdate: ${_birthDateController.text}");
                ("Start Time: ${_startTimeController.text}");
                ("End Time: ${_endTimeController.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
