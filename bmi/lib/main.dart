import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffE83D66),
        scaffoldBackgroundColor: const Color(0xff1D2136),
      ),
      home: const HomePage(),
    );
  }
}
