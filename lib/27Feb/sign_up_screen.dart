import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value == null) {
                    return 'Email cannot be null';
                  } else if (value.isEmpty) {
                    return 'Email cannot be empty';
                  } else if (!value.contains('@')) {
                    return 'Please include an @ symbol';
                  } else if (!value.contains('.')) {
                    return 'Please include a . after the @ symbol';
                  } else if (!isValidEmail(value)) {
                    return 'Please enter correct email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Email')),
              ),
              TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                validator: (value) {
                  if (value == null) {
                    return 'Phone number cannot be null';
                  } else if (value.isEmpty) {
                    return 'Phone number cannot be empty';
                  } else if (value.length != 10) {
                    return 'Phone number must be 10 digits long';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Phone Number')),
              ),
              ElevatedButton(
                  onPressed: () {
                    late SnackBar snackBar;

                    if (_formKey.currentState!.validate()) {
                      snackBar = SnackBar(
                          content: Text('Form submitted successfully!'));
                    } else {
                      snackBar = SnackBar(
                          content: Text('Error: Invalid form details!'));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
