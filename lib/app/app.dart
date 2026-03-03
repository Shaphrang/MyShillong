//lib\app\app.dart
import 'package:flutter/material.dart';
import '../modules/food/data/food_repository.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FoodRepository repo = FoodRepository();

  @override
  void initState() {
    super.initState();
    testConnection();
  }

  Future<void> testConnection() async {
    final offers = await repo.getTodayOffers();
    debugPrint('Offers: $offers');
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('MyShillong App'),
        ),
      ),
    );
  }
}