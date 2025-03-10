import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learning/10_march/post_model.dart';
import 'package:http/http.dart' as http;

class RealTimeListScreen extends StatefulWidget {
  const RealTimeListScreen({super.key});

  @override
  State<RealTimeListScreen> createState() => _RealTimeListScreenState();
}

class _RealTimeListScreenState extends State<RealTimeListScreen> {
  bool isLoading = true;
  List<PostModel> posts = [];

  @override
  void initState() {
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Realtime List'),
        ),
        body: buildBody());
  }

  Future<List<PostModel>> getFutureValue() async {
    http.Response result =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (result.statusCode == 200) {
      String value = result.body;
      List<PostModel> list = [];

      List<dynamic> response = jsonDecode(result.body.toString());
      log('Length of response: ${response.length}');

      for (var element in response) {
        PostModel postModel = PostModel.fromJson(element);
        list.add(postModel);
      }

      return list;
    } else {
      return [];
    }
  }

  Future<void> fetchPosts() async {
    List<PostModel> list = await getFutureValue();
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoading = false;
      posts = list;
    });
  }

  Widget buildFutureBuilder() {
    return FutureBuilder(
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
          List<PostModel>? list = snapshot.data;
          if (list == null || list.isEmpty) {
            return Center(child: Text('No Posts'));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text((list[index].id ?? (index + 1)).toString()),
                ),
                title: Text(
                  list[index].title ?? 'Sample title',
                  maxLines: 1,
                ),
                subtitle: Text(list[index].body ?? "Sample body", maxLines: 2),
                trailing: Icon(Icons.arrow_forward_rounded),
              );
            },
          );
        }
        return Center(child: Text('Loading...'));
      },
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    List<PostModel>? list = posts;

    if (list.isEmpty) {
      return Center(child: Text('No Posts'));
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text((list[index].id ?? (index + 1)).toString()),
          ),
          title: Text(
            list[index].title ?? 'Sample title',
            maxLines: 1,
          ),
          subtitle: Text(list[index].body ?? "Sample body", maxLines: 2),
          trailing: Icon(Icons.arrow_forward_rounded),
        );
      },
    );
  }
}
