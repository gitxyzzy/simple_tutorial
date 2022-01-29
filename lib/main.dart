import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_tutorial/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        home: CounterScreen(),
      ),
    );
  }
}

// widget --> element + state

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final counter = Provider.of<Counter>(context, listen: false);
          // final counter = context.read<Counter>();
          // counter.value++;
          context.read<Counter>().value++;
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, _) {
            return Text(
              counter.value.toString(),
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
    );
  }
}

// class CounterValue extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final counter = Provider.of<Counter>(context);
//     final counter = context.watch<Counter>();
   
//   }
// }
