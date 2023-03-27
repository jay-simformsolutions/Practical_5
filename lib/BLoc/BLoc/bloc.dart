import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class Counter extends Bloc<CounterEvent, int> {
  Counter(super.initialState);

  int get initialValue => 0;

  @override
  Stream mapeventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}
