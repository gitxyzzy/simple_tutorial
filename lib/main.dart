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
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counter.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: TextStyle(fontSize: 40),
              );
            } else {
              return Text("An error occurred!");
            }
          },
        ),
      ),
    );
  }
}

// class CounterValue extends StatefulWidget {
//   final Counter counter;

//   CounterValue(this.counter);

//   @override
//   State<CounterValue> createState() => _CounterValueState();
// }

// class _CounterValueState extends State<CounterValue> {
//   int counterValue = 0;

//   void updateValue(int newValue) {
//     setState(() => counterValue = newValue);
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.counter.stream.listen(updateValue);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       counterValue.toString(),
//       style: TextStyle(fontSize: 40),
//     );
//   }
// }
