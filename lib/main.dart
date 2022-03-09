import 'package:counter/counter_view.dart';
import 'package:counter/counters_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'counter_view_model.dart';

final countersViewModelProvider =
    StateNotifierProvider<CountersViewModel, CountersState>(
        (ref) => CountersViewModel());

Future<void> main() async {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FlutterDemo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const CountersList(),
    );
  }
}
