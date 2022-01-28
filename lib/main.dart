import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider.value(
      value: counter,
      child: Scaffold(
        appBar: AppBar(title: Text("Counter")),
        floatingActionButton: FloatingActionButton(
          onPressed: counter.increment,
          child: Icon(Icons.add),
        ),
        body: Center(
          child: CounterValue(),
        ),
      ),
    );
  }
}

class CounterValue extends StatefulWidget {
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
    final counter = Provider.of<Counter>(context, listen: false);
    counter.addListener(counterValueListener);
  }

  @override
  void dispose() {
    super.dispose();
    final counter = Provider.of<Counter>(context, listen: false);
    counter.removeListener(counterValueListener);
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text(
      counter.value.toString(),
      style: TextStyle(fontSize: 40),
    );
  }
}
