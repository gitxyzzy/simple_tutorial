// https://bloclibrary.dev/#/

import 'dart:async';
import 'package:flutter/material.dart';

enum Events {
  Increment,
}

class Counter {
  int _value = 0;

  final _controller = StreamController<int>();
  final _backflow = StreamController<Events>();

  Counter() {
    _backflow.stream.listen(_eventHandler);
  }

  Stream<int> get stream => _controller.stream;

  void _increment() {
    _value++;
    _controller.sink.add(_value);
  }

  void _eventHandler(Events e) {
    if (e == Events.Increment) {
      _increment();
    }
  }

  void addEvent(Events e) {
    _backflow.sink.add(e);
  }
}

// Streams
// sink -----------> (stream)
//  ^ (add stuff)         ^ obtain 
//  ^ counter           ^ ui
