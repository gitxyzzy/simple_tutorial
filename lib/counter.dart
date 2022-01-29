import 'dart:async';

import 'package:flutter/material.dart';

class Counter {
  int _value = 0;

  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _value++;
    _controller.sink.add(_value);
  }
}

// Streams
// sink -----------> (stream)
//  ^ (add stuff)         ^ obtain 
//  ^ counter           ^ ui

  