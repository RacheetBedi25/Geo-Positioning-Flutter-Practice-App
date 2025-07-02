import 'package:flutter/material.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Location',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 30.0,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
