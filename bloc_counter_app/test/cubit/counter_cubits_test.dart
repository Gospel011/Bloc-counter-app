import 'package:bloc_counter_app/cubits/counter_cubit/counter_cubits_cubit.dart';
import 'package:bloc_counter_app/cubits/counter_cubit/counter_cubits_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "Counter cubits test group",
    () {
      CounterCubitsCubit? counterCubit;

      setUp(() {
        // print('setup called');
        counterCubit = CounterCubitsCubit();
      });

      tearDown(() {
        // print('teardown called');
        counterCubit = CounterCubitsCubit();
      });


      //! TEST COUNTER CUBIT INITIAL STATE
      test('Test counter cubit initial state', () {
        expect(counterCubit?.state, const CounterCubitsState(counterValue: 0));
      });

      //! CONFIRM THE STATE EMITTED BY THE COUNTER CUBITS STATE WHEN INCREMENTED
      blocTest<CounterCubitsCubit, CounterCubitsState>(
        'emits CounterCubitsState(counterValue: [int], operation: CounterStates.increment ) when cubit.increment is called.',
        build: () => CounterCubitsCubit(),
        act: (cubit) {
          for (int i = 0; i < 100; i++) {
            cubit.increment();
          }
        },
        expect: () {
          List<CounterCubitsState> counterCubitsStateList = [];
          for (int i = 0; i < 100; i++) {
            counterCubitsStateList.add(CounterCubitsState(
                counterValue: i + 1, operation: CounterStates.increment));
          }

          return counterCubitsStateList;
        },
      );

      //! CONFIRM THE STATE EMITTED BY THE COUNTER CUBITS STATE WHEN DECREMENTED
      blocTest<CounterCubitsCubit, CounterCubitsState>(
        'emits CounterCubitsState(counterValue: [int], operation: CounterStates.decrement ) when cubit.decrement is called.',
        build: () => CounterCubitsCubit(),
        act: (cubit) {
          for (int i = 0; i < 100; i++) {
            cubit.decrement();
          }
        },
        expect: () {
          List<CounterCubitsState> counterCubitsStateList = [];
          for (int i = 0; i < 100; i++) {
            counterCubitsStateList.add(CounterCubitsState(
                counterValue: (i + 1) * -1, operation: CounterStates.decrement));
          }

          return counterCubitsStateList;
        },
      );
    },
  );
}
