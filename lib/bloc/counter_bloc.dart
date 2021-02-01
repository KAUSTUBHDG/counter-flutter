import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    int countxx = state.count;
    if (event is IncrementEvent) {
      print('$countxx');
      int counts = increment(countxx);
      print('$counts');
      // int zzz = countxx + 1;
      yield CounterIncrement(count: /*countxx */ counts);
    }
    if (event is DecrementEvent) {
      print('$countxx');
      int counts = decrement(countxx);
      print('$counts');
      yield CounterDecrement(
          count: /*count <= 0 ? count = 0 : count-- */ counts);
    }
    if (event is ResetEvent) {
      print('$countxx');
      int counts = reset(countxx);
      print('$counts');
      yield CounterReset(count: counts /* = 0*/);
    }
    yield CounterUpdate(countxx);
  }

  increment(int counte) {
    counte = counte + 1;
    return counte;
  }

  decrement(int count) {
    return count <= 0 ? count = 0 : count--;
  }

  reset(int count) {
    return count = 0;
  }
}
