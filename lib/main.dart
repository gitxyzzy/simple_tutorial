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

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final counter = Counter();

  void counterValueListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // call counterValueListener when value changes
    counter.addListener(counterValueListener);
  }

  @override
  void dispose() {
    super.dispose();
    counter.removeListener(counterValueListener);
  }

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
        child: Text(
          counter.value.toString(),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
