import 'package:flutter/material.dart';
import 'package:personal_site/screens/home.dart';
import 'package:personal_site/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eri\'s personal site',
      theme: customTheme,
      home: const MyHomePage(),
    );
  }
}


