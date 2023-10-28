import 'package:equatable/equatable.dart';

// part of 'counter_cubits_cubit.dart';

enum CounterStates { increment, decrement }

class CounterCubitsState extends Equatable {
  final int counterValue;
  final CounterStates? operation;

  const CounterCubitsState({required this.counterValue, this.operation});
  
  @override  
  List<Object?> get props => [counterValue, operation];
}
