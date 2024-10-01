import 'package:flutter/material.dart';

class CustomRegistrationWidget extends StatefulWidget {
  const CustomRegistrationWidget({super.key});

  @override
  _CustomRegistrationWidgetState createState() =>
      _CustomRegistrationWidgetState();
}

class _CustomRegistrationWidgetState extends State<CustomRegistrationWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle registration logic here
              print('Username: ${_usernameController.text}');
              print('Email: ${_emailController.text}');
              print('Password: ${_passwordController.text}');
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
