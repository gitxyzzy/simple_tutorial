import 'package:flutter/material.dart';
import 'package:simple_tutorial/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    print('build was called');
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: Icon(Icons.add),
      ),
      body: Center(
        child: CounterValue(counter),
      ),
    );
  }
}

class CounterValue extends StatefulWidget {
  final Counter counter;

  CounterValue(this.counter);

  @override
  _CounterValueState createState() => _CounterValueState();
}

class _CounterValueState extends State<CounterValue> {
  void counterValueListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // call counterValueListener when value changes
    widget.counter.addListener(counterValueListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.counter.removeListener(counterValueListener);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.counter.value.toString(),
      style: TextStyle(fontSize: 40),
    );
  }
}
