import 'package:flutter/material.dart';

class ScrollExample extends StatefulWidget {
  const ScrollExample({super.key});

  @override
  State<ScrollExample> createState() => _ScrollExampleState();
}

class _ScrollExampleState extends State<ScrollExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll'),
      ),
      body: getListViewBuilder(),
    );
  }

  getListViewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            print('${index + 1} container is rendered');
            return Container(
              width: 100,
              color: Colors.red,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  getListView() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            print('1st container is rendered');
            return Container(
              height: 200,
              color: Colors.red,
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            print('2nd container is rendered');
            return Container(
              height: 200,
              color: Colors.red,
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            print('3rd container is rendered');
            return Container(
              height: 200,
              color: Colors.red,
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            print('4th container is rendered');
            return Container(
              height: 200,
              color: Colors.red,
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(builder: (context) {
            print('5th container is rendered');
            return Container(
              height: 200,
              color: Colors.red,
            );
          }),
        ),
      ],
    );
  }
}
