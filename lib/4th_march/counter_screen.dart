import 'package:flutter/material.dart';
import 'package:flutter_learning/4th_march/counter_decrement.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () async {
                int? updatedValue =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CounterDecrement(
                    value: counter,
                  ),
                ));
                if (updatedValue != null) {
                  setState(() {
                    counter = updatedValue;
                  });
                }
              },
              child: Text('New screen'),
            )
          ],
        ),
      ),
    );
  }
}
