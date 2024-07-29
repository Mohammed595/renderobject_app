import 'package:flutter/material.dart';
import 'package:renderobject_app/custom_padding.dart';
import 'package:renderobject_app/custom_sizedbox.dart';

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
    return  const MaterialApp(
      home: Scaffold(
        body: CustomPadding(
          
          padding: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(23)),
              CustomSizedBox(
                height: 23,
                width: 23,
                child: Text('sdf'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
