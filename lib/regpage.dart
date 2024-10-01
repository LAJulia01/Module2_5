// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Register());
// }

// class Register extends StatelessWidget {
//   const Register({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyFormPage(),
//     );
//   }
// }

// class MyFormPage extends StatefulWidget {
//   const MyFormPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyFormPageState createState() => _MyFormPageState();
// }

// class _MyFormPageState extends State<MyFormPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _textFieldController = TextEditingController();
//   String dropdownValue = 'One';
//   int selectedValue = 1;
//   bool isChecked = false;
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Form Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               // Custom Text Field
//               CustomTextField(
//                 controller: _textFieldController,
//                 labelText: 'Enter Text',
//               ),
              
//               // Dropdown
//               DropdownButton<String>(
//                 value: dropdownValue,
//                 icon: const Icon(Icons.arrow_downward),
//                 items: <String>['One', 'Two', 'Three', 'Four']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     dropdownValue = newValue!;
//                   });
//                 },
//               ),
              
//               // Radio Button
//               RadioListTile<int>(
//                 title: const Text('Option 1'),
//                 value: 1,
//                 groupValue: selectedValue,
//                 onChanged: (int? value) {
//                   setState(() {
//                     selectedValue = value!;
//                   });
//                 },
//               ),
//               RadioListTile<int>(
//                 title: const Text('Option 2'),
//                 value: 2,
//                 groupValue: selectedValue,
//                 onChanged: (int? value) {
//                   setState(() {
//                     selectedValue = value!;
//                   });
//                 },
//               ),
              
//               // Checkbox
//               CheckboxListTile(
//                 title: const Text('Check me'),
//                 value: isChecked,
//                 onChanged: (bool? value) {
//                   setState(() {
//                     isChecked = value!;
//                   });
//                 },
//               ),
              
//               // Date Picker
//               ListTile(
//                 title: Text('Select Date: ${selectedDate.toLocal()}'),
//                 trailing: const Icon(Icons.calendar_today),
//                 onTap: () => _selectDate(context),
//               ),
              
//               // Time Picker
//               ListTile(
//                 title: Text('Select Time: ${selectedTime.format(context)}'),
//                 trailing: const Icon(Icons.access_time),
//                 onTap: () => _selectTime(context),
//               ),
              
//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')),
//                     );
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Custom TextField Widget
// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;

//   const CustomTextField({super.key, required this.controller, required this.labelText});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(labelText: labelText),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter some text';
//         }
//         return null;
//       },
//     );
//   }
// }
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
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers for text fields
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _gender = 'Male';
  DateTime _birthdate = DateTime.now();

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
                print("Gender: $dropdownGender");
                print("Civil Status: $selectedStatus");
                print("Subjects: Math: $isMathChecked, English: $isEnglishChecked, Science: $isScienceChecked");
                print("Birthdate: ${_birthDateController.text}");
                print("Start Time: ${_startTimeController.text}");
                print("End Time: ${_endTimeController.text}");
              },
              child: const Text('Submit'),
            ),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                onSaved: (value) => _username = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => _password = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onSaved: (value) => _confirmPassword = value!,
              ),
              DropdownButtonFormField<String>(
                value: _gender,
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Birthdate'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _birthdate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null && pickedDate != _birthdate) {
                    setState(() {
                      _birthdate = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                  text: "${_birthdate.toLocal()}".split(' ')[0],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle registration logic here
                  }
                },
                child: const Text('Register'),
              ),
          ],
        ),
      ),
    );
  }
}
// class _SignInPageState extends State<Register> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _username = '';
//   String _password = '';
//   String _confirmPassword = '';
//   String _gender = 'Male';
//   DateTime _birthdate = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 onSaved: (value) => _name = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Username'),
//                 onSaved: (value) => _username = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 onSaved: (value) => _password = value!,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Confirm Password'),
//                 obscureText: true,
//                 onSaved: (value) => _confirmPassword = value!,
//               ),
//               DropdownButtonFormField<String>(
//                 value: _gender,
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 items: ['Male', 'Female', 'Other']
//                     .map((label) => DropdownMenuItem(
//                           child: Text(label),
//                           value: label,
//                         ))
//                     .toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _gender = value!;
//                   });
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Birthdate'),
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                     context: context,
//                     initialDate: _birthdate,
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (pickedDate != null && pickedDate != _birthdate) {
//                     setState(() {
//                       _birthdate = pickedDate;
//                     });
//                   }
//                 },
//                 controller: TextEditingController(
//                   text: "${_birthdate.toLocal()}".split(' ')[0],
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     // Handle registration logic here
//                   }
//                 },
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

