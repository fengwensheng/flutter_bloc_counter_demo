/*
 * @Author: Vincent Feng 
 * @Date: 2020-07-11 12:01:02 
 * @Last Modified by: Vincent Feng
 * @Last Modified time: 2020-07-11 12:42:24
 */

import 'dart:async';

import 'package:flutter_bloc_counter_demo/counterEvent.dart';

class CounterBloc {
  // data field
  int _counter = 0;
  // pipe | a Stream for events
  //pipe for CounterEvent
  StreamController<CounterEvent> _counterEventStreamController =
      StreamController<CounterEvent>();
  //sink is a (), so use GET() to hold it
  Sink<CounterEvent> get counterEventSink => _counterEventStreamController.sink;
  Stream<CounterEvent> get _counterEventStream =>
      _counterEventStreamController.stream;
  // pipe | a Stream for state
  // pipe for intState
  StreamController<int> _counterStateStreamController = StreamController<int>();
  Sink<int> get _counterStateSink => _counterStateStreamController.sink;
  Stream<int> get counterStateStream => _counterStateStreamController.stream;
  // method
  CounterBloc() {
    _counterEventStream.listen(_mapEventToState);
  }
  void _mapEventToState(CounterEvent counterEvent) {
    counterEvent is DecrementCounterEvent ? _counter-- : _counter++;
    _counterStateSink.add(_counter);
  }

  void dispose() {
    _counterEventStreamController.close();
    _counterStateStreamController.close();
  }

  /// end
}
