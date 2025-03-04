import 'package:flutter/material.dart';
import 'package:flutter_learning/27Feb/login_form.dart';
import 'package:flutter_learning/27Feb/sign_up_screen.dart';
import 'package:flutter_learning/4th_march/counter_screen.dart';
import 'package:flutter_learning/4th_march/scroll_example.dart';
import 'package:flutter_learning/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginFormScreen(),
                  ));
                },
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ));
                },
                child: Text('Signup'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
                },
                child: Text('Profile'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScrollExample(),
                  ));
                },
                child: Text('List'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CounterScreen(),
                  ));
                },
                child: Text('Counter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
