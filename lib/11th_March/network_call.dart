import 'package:flutter/material.dart';
import 'package:flutter_learning/11th_March/network_screen_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class NetworkCall extends StatefulWidget {
  const NetworkCall({super.key});

  @override
  State<NetworkCall> createState() => _NetworkCallState();
}

class _NetworkCallState extends State<NetworkCall> {
  NetworkScreenController controller = Get.put(NetworkScreenController());

  @override
  void initState() {
    controller.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network example'),
      ),
      body: GetBuilder<NetworkScreenController>(
        builder: (controller) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.data == null) {
            return Center(child: Text("Something went wrong"));
          }
          return Center(child: Text(controller.data.toString()));
        },
      ),
    );
  }
}
