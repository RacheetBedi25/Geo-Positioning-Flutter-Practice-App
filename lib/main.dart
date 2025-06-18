import 'package:flutter/material.dart';

// https://pub.dev/packages/geolocator

// I diligently copied all this code from a github

void main() {
  runApp(
    MaterialApp(
      title: 'GeoLocator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(child: Container(child: Text('I\'m the flutter goat'))),
      ),
    ),
  );
}
