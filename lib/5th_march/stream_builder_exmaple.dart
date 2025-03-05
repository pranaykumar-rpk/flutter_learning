import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late StreamController<int> _numberStreamController;

  @override
  void initState() {
    super.initState();
    log("Init method is called");
    // Create a stream controller and add numbers to the stream.
    _numberStreamController = StreamController<int>();
    _startAddingNumbers(); // Start adding numbers to the stream.
  }

  void _startAddingNumbers() async {
    for (int i = 0; i <= 10; i++) {
      log('For loop is triggere with index:$i');
      if (_numberStreamController.isClosed) {
        log('Stream is closed, breaking loop');
        break;
      } else {
        await Future.delayed(Duration(seconds: 2));
        if (_numberStreamController.hasListener &&
            !_numberStreamController.isClosed) {
          _numberStreamController.sink.add(i);
        } else {
          return;
        }
      }
    }
  }

  @override
  void dispose() {
    log("Dispose method is called");
    _numberStreamController.close(); // Close the stream when disposing.

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _numberStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display a loading indicator when waiting for data.
            } else if (snapshot.hasError) {
              return Text(
                  'Error: ${snapshot.error}'); // Display an error message if an error occurs.
            } else if (!snapshot.hasData) {
              return Text(
                  'No data available'); // Display a message when no data is available.
            } else {
              return Text(
                'Latest Number: ${snapshot.data}',
                style: TextStyle(fontSize: 24),
              ); // Display the latest number when data is available.
            }
          },
        ),
      ),
    );
  }
  // int counter = 0;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Stream builder'),
  //     ),
  //     body: StreamBuilder(
  //       stream: getStream(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Center(child: CircularProgressIndicator());
  //         } else if (snapshot.connectionState == ConnectionState.done) {
  //           return Center(
  //             child: Text('Here goes actual data'),
  //           );
  //         }
  //         return Center(child: Text('Default scenario'));
  //       },
  //     ),
  //   );
  // }

  // getStream() {}
}
