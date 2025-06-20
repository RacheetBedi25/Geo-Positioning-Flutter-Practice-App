import 'package:flutter/material.dart';
import 'Home.dart';

// https://pub.dev/packages/geolocator

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GeoLocator App',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),

      home: Home(),
    );
  }
}
