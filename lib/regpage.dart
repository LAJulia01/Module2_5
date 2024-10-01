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
                print(
                    "Subjects: Math: $isMathChecked, English: $isEnglishChecked, Science: $isScienceChecked");
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
//

class CustomRegister extends StatelessWidget {
  const CustomRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CustomRegisterPage(),
      debugShowCheckedModeBanner: false, // Hide the debug banner
    );
  }
}

class CustomRegisterPage extends StatefulWidget {
  const CustomRegisterPage({super.key});

  @override
  _CustomRegisterPageState createState() => _CustomRegisterPageState();
}

class _CustomRegisterPageState extends State<CustomRegisterPage> {
  // Controllers for text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  // Dropdown Gender options
  String dropdownGender = 'Male'; // Default gender

  // Radio button Civil Status options
  String selectedStatus = 'Single'; // Default civil status

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Method to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text =
            "${picked.toLocal()}".split(' ')[0]; // Format date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Custom Registration',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple, // App bar background color
        centerTitle: true, // Center the title
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Form(
          key: _formKey, // Form key for validation
          child: ListView(
            children: [
              const SizedBox(height: 20),

              // Custom Username Field
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:
                      const Icon(Icons.person, color: Colors.deepPurple),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Custom Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Custom Dropdown for Gender
              DropdownButtonFormField<String>(
                value: dropdownGender,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person_outline,
                      color: Colors.deepPurple),
                ),
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

              // Custom Radio buttons for Civil Status
              const Text(
                'Civil Status:',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              RadioListTile<String>(
                title: const Text('Single'),
                value: 'Single',
                groupValue: selectedStatus,
                activeColor: Colors.deepPurple,
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
                activeColor: Colors.deepPurple,
                onChanged: (String? value) {
                  setState(() {
                    selectedStatus = value!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Custom Date Picker for Birthdate
              TextFormField(
                controller: _birthDateController,
                decoration: InputDecoration(
                  labelText: 'Birthdate',
                  hintText: 'Select your birthdate',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(Icons.calendar_today,
                      color: Colors.deepPurple),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 40),

              // Custom Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor:
                        Colors.deepPurple, // Button background color
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                      print("Username: ${_usernameController.text}");
                      print("Password: ${_passwordController.text}");
                      print("Gender: $dropdownGender");
                      print("Civil Status: $selectedStatus");
                      print("Birthdate: ${_birthDateController.text}");
                    }
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
