import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void _increment() => emit(state + 1);
  void _decrement() => emit(state - 1);
}

Future<void> main(List<String> args) async {
  CounterCubit cubit = CounterCubit();

  // print('Initial state = ${cubit.state}');

  // cubit._increment();

  // print('Current state = ${cubit.state}');

  // cubit._increment();

  // print('Current state = ${cubit.state}');

  // cubit._decrement();

  // print('Current state = ${cubit.state}');

  // cubit._increment();

  // print('Current state = ${cubit.state}');

  // cubit._increment();

  // print('Final state = ${cubit.state}');

  //! SINCE CUBITS EMIT STATES THAT CAN BE LISTENED TO, WE CAN ALSO SUBSCRIBE
  //! TO THE CUBIT AND LISTEN FOR ANY STATE STREAMS USING STREAMINSTANCE.STREAM.LISTEN()

  final subscription = cubit.stream.listen(print);

  cubit._increment();
  cubit._increment();
  cubit._decrement();
  cubit._increment();
  cubit._increment();
  cubit._decrement();
  cubit._increment();
  cubit._increment();
  cubit._increment();
  cubit._increment();
  cubit._increment();

  await Future.delayed(Duration.zero);

  await subscription.cancel();
  await cubit.close();
}
