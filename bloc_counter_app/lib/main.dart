import 'package:bloc_counter_app/cubits/counter_cubit/counter_cubits_cubit.dart';
import 'package:bloc_counter_app/cubits/counter_cubit/counter_cubits_state.dart';
import 'package:bloc_counter_app/tut/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubitsCubit>(
      create: (context) => CounterCubitsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<CounterCubitsCubit, CounterCubitsState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( state.operation == CounterStates.decrement ? 'Decrement!' : 'Increment!'), duration: const Duration(milliseconds: 500),));
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //? BLOCBUILDER FOR TEXT WIDGET
              Text(
                state.counterValue.toString(),
                style: const TextStyle(fontSize: 32),
              ),

              //* SOME WHITE SPACING
              const SizedBox(
                height: 40,
              ),

              //? THE ROW OF BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubitsCubit>().increment();
                    },
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder())),
                    child: const Icon(Icons.add),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubitsCubit>().decrement();
                    },
                    style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(CircleBorder())),
                    child: const Icon(Icons.remove),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
