import 'package:flutter/material.dart';

void main() {
  runApp(const MyShillongApp());
}

class MyShillongApp extends StatelessWidget {
  const MyShillongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShillong',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            "MyShillong\nYour City. Your Deals.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}