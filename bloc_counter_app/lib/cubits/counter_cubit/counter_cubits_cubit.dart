import 'package:bloc/bloc.dart';


import 'counter_cubits_state.dart';
// import 'package:meta/meta.dart';

// part 'counter_cubits_state.dart';

// enum CounterEvent { increment, decrement }

class CounterCubitsCubit extends Cubit<CounterCubitsState> {
  CounterCubitsCubit() : super(CounterCubitsState(counterValue: 0));

  void increment() => emit(CounterCubitsState(counterValue: state.counterValue + 1, operation: CounterStates.increment));
  void decrement() => emit(CounterCubitsState(counterValue: state.counterValue - 1, operation: CounterStates.decrement));
}
