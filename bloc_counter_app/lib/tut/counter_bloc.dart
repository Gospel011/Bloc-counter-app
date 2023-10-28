import 'dart:async';

import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      switch (event) {
      case CounterEvent.increment:
        emit(state + 1);
        break;
      case CounterEvent.decrement:
        emit(state - 1);
        break;
      default:
        throw Exception('$event not a valid counter event');
  }});
  }

 
  }


void main(List<String> args) {
  CounterBloc bloc = CounterBloc();
  final StreamSubscription blocStream = bloc.stream.listen(print);

  bloc.add(CounterEvent.increment);
}
