import 'package:flutter/material.dart';
import 'package:sample_application/27Feb/login_form.dart';
import 'package:sample_application/27Feb/sign_up_screen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}
