import 'package:flutter/material.dart';
import 'package:flutter_learning/10_march/hotel_screen.dart';
import 'package:flutter_learning/10_march/realtime_list_screen.dart';
import 'package:flutter_learning/11th_March/counter_screen.dart';
import 'package:flutter_learning/11th_March/network_call.dart';
import 'package:flutter_learning/27Feb/login_form.dart';
import 'package:flutter_learning/27Feb/sign_up_screen.dart';
import 'package:flutter_learning/4th_march/counter_screen.dart';
import 'package:flutter_learning/4th_march/scroll_example.dart';
import 'package:flutter_learning/5th_march/future_builder_exmple.dart';
import 'package:flutter_learning/5th_march/stream_builder_exmaple.dart';
import 'package:flutter_learning/profile.dart';
import 'package:get/route_manager.dart';

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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginFormScreen());

                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => LoginFormScreen(),
                      // ));
                    },
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => SignUpScreen());
                    },
                    child: Text('Signup'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => Profile());
                    },
                    child: Text('Profile'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => ScrollExample());
                    },
                    child: Text('List'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => CounterScreen());
                    },
                    child: Text('Counter'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => FutureBuilderExample());
                    },
                    child: Text('Future Builder '),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => StreamBuilderExample());
                    },
                    child: Text('Stream Builder '),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => RealTimeListScreen());
                    },
                    child: Text('Realtime List'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => HotelListScreen());
                    },
                    child: Text('Hotel Screen'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => CounterWithGetx());
                    },
                    child: Text('Counter Screen'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => NetworkCall());
                    },
                    child: Text('Network call with Getx'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
