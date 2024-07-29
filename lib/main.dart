import 'package:flutter/material.dart';
import 'package:renderobject_app/prodect_card_renderbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ProductCard(
          productName: 'Chuck 70',
          price: 65.57,
          selectedColor: Colors.black,
          unselectedColor: Colors.white,
          isFavorite: true,
          hasShipping: true,
        ),
      ),
    );
  }
}
