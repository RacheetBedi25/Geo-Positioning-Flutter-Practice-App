import 'package:flutter/material.dart';

// https://pub.dev/packages/geolocator

void main() {
  runApp(
    MaterialApp(
      title: 'GeoLocator App',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  final double topGap = 200.0;
  final double buttonGap = 30.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Home',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Welcome!',
              style: TextStyle(
                fontFamily: 'GloriaHallelujah',
                fontSize: 17.0,
                fontWeight: FontWeight.w100,
                letterSpacing: 5.0,
                color: Colors.grey[300],
              ),
              softWrap: true,
            ),
          ],
        ),
        centerTitle: true,
        leading: Transform.scale(
          scale: 0.8,
          child: Image.asset('assets/icons/map_icon.png', color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: infoButtonPressed,
            alignment: Alignment.center,
            iconSize: 40.0,
            icon: Icon(Icons.info),
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.purple[300],
      ),
      body: Column(
        children: [
          createButtonRow(
            MainAxisAlignment.center,
            EdgeInsets.only(top: topGap),
            myLocationButtonPressed,
            'My Location',
          ),
          createButtonRow(
            MainAxisAlignment.center,
            EdgeInsets.only(top: buttonGap),
            geoFenceButtonPressed,
            'GeoFence',
          ),
          createButtonRow(
            MainAxisAlignment.center,
            EdgeInsets.only(top: buttonGap),
            geoFenceButtonPressed,
            'Settings',
          ),
          createButtonRow(
            MainAxisAlignment.center,
            EdgeInsets.only(top: buttonGap),
            geoFenceButtonPressed,
            'More',
          ),
        ],
      ),
    );
  }

  Row createButtonRow(
    MainAxisAlignment mainAlignment,
    EdgeInsets margin,
    VoidCallback onPressed,
    String text,
  ) {
    return Row(
      mainAxisAlignment: mainAlignment,
      children: [
        Container(
          margin: margin,
          child: ElevatedButton(onPressed: onPressed, child: Text(text)),
        ),
      ],
    );
  }

  void infoButtonPressed() {}

  void geoFenceButtonPressed() {}

  void settingsButtonPressed() {}

  void moreButtonPressed() {}

  void myLocationButtonPressed() {}
}
