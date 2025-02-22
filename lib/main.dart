import 'package:flutter/material.dart';
import 'package:sliver_test_2025/home.dart';
import 'package:sliver_test_2025/sliver1.dart';
import 'package:sliver_test_2025/sliver2.dart';
import 'package:sliver_test_2025/sliver3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        'sliver1': (context) => const Sliver1(),
        'sliver2': (context) => const Sliver2(),
        'sliver3': (context) => const Sliver3(),
      },
    );
  }
}
