import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future builder'),
      ),
      body: FutureBuilder(
        future: getFutureValue(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error.toString()}'));
            }
            //Data exists scenario
            if (snapshot.data == null) {
              return Center(child: Text('No data available'));
            } else if (snapshot.data!.isEmpty) {
              return Center(child: Text('Empty data'));
            }
            return Center(
                child: SingleChildScrollView(child: Text(snapshot.data!)));
          }
          return Center(child: Text('Loading...'));
        },
      ),
    );
  }

  Future<String> getFutureValue() async {
    http.Response result =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (result.statusCode == 200) {
      String value = result.body;

      List<dynamic> response = jsonDecode(result.body.toString());
      response = [
        {
          "title": 'This is 1st title',
        },
        {'id': 'This is 2nd title'}
      ];
      return response[1]['title'];
    } else {
      return "Something went wrong";
    }
  }
}
