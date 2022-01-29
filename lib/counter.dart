// https://bloclibrary.dev/#/

import 'package:state_notifier/state_notifier.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() {
    state = state + 1;
  }
}

// Streams
// sink -----------> (stream)
//  ^ (add stuff)         ^ obtain 
//  ^ counter           ^ ui
