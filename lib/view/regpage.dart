import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
        _birthDateController.text =
            "${picked.toLocal()}".split(' ')[0]; // Format date
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
            // Username field
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // Email field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),

            // Password field
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),

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
            TextField(
              controller: _birthDateController,
              decoration: const InputDecoration(
                labelText: 'Birthdate',
                hintText: 'Select your birthdate',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 20),

            // Time Pickers for Class Schedule
            TextField(
              controller: _startTimeController,
              decoration: const InputDecoration(
                labelText: 'Class Start Time',
                hintText: 'Select start time',
                suffixIcon: Icon(Icons.access_time),
              ),
              readOnly: true,
              onTap: () {
                _selectStartTime(context);
              },
            ),
            TextField(
              controller: _endTimeController,
              decoration: const InputDecoration(
                labelText: 'Class End Time',
                hintText: 'Select end time',
                suffixIcon: Icon(Icons.access_time),
              ),
              readOnly: true,
              onTap: () {
                _selectEndTime(context);
              },
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                print("Username: ${_usernameController.text}");
                print("Email: ${_emailController.text}");
                print("Password: ${_passwordController.text}");
                print("Gender: $dropdownGender");
                print("Civil Status: $selectedStatus");
                print("Subjects: Math: $isMathChecked, English: $isEnglishChecked, Science: $isScienceChecked");
                print("Birthdate: ${_birthDateController.text}");
                print("Start Time: ${_startTimeController.text}");
                print("End Time: ${_endTimeController.text}");
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
