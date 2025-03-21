import 'package:flutter/material.dart';
import 'package:flutter_learning/27Feb/sign_up_screen.dart';
import 'package:flutter_learning/home_screen.dart';
import 'package:flutter_learning/4th_march/scroll_example.dart';
import 'package:flutter_learning/profile.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomeScreen());
  }
}
