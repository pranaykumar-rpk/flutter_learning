import 'package:flutter/material.dart';

class CounterDecrement extends StatefulWidget {
  final int value;
  const CounterDecrement({super.key, required this.value});

  @override
  State<CounterDecrement> createState() => _CounterDecrementState();
}

class _CounterDecrementState extends State<CounterDecrement> {
  int newCounter = 0;

  @override
  void initState() {
    print('Init state is called');
    newCounter = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    print('Dispose state is called');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CounterDecrement oldWidget) {
    print('Did update widget is called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('Did change dependencies is called');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            newCounter = newCounter - 1;
          });
        },
        child: Icon(Icons.remove),
      ),
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              newCounter.toString(),
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, newCounter);
                },
                child: Text('Go back'))
          ],
        ),
      ),
    );
  }
}
