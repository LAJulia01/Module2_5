import 'package:flutter/material.dart';
import 'package:module2_5/views/custombutton.dart';
import 'package:module2_5/views/customfield.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final txtController = TextEditingController();
  final txtController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Validation')),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              

              TextFormField(
                controller: txtController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              
              ElevatedButton(
                onPressed: () {
                  var input = txtController.text;
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You entered $input')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              CustomTextField(
                controller_: txtController,
                isPassword_: false,
                error_: 'The username must not be empty!',
                hintText_: 'Enter your username',
                labelText_: 'USERNAME',
              ),

              CustomTextField(
                controller_: txtController1,
                isPassword_: true,
                error_: 'The password must not be empty!',
                hintText_: 'Enter your password',
                labelText_: 'PASSWORD',
              ),

              CustomButton(
                btnText_: 'LOGIN',
                onPressed_: () {
                  var input = txtController.text;
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('You entered $input')),
                    );
                  }
                }, //snackbar
              ),
              
              //Your widgets
            ],
          ), // Column
        ), // Center
      ), // Form
    ); // Scaffold
  }
}
