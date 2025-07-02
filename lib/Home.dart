import 'package:flutter/material.dart';
import 'package:geo_positioning_app/GeoFence.dart';
import 'package:geo_positioning_app/InfoButton.dart';
import 'package:geo_positioning_app/More.dart';
import 'package:geo_positioning_app/MyLocation.dart';
import 'package:geo_positioning_app/RowButton.dart';
import 'package:geo_positioning_app/Settings.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.screenSize});

  final Size screenSize;

  late final double topGap = screenSize.height * 0.22; // percent of height
  late final double buttonGap = screenSize.width * 0.10; // percent of width

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/blueGlobeBlueeee_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            RowButton(
              mainAlignment: MainAxisAlignment.center,
              margin: EdgeInsets.only(top: topGap),
              width: 250.0,
              onPressed: goToPage(context, MyLocation()),
              text: 'My Location',
            ),
            RowButton(
              mainAlignment: MainAxisAlignment.center,
              margin: EdgeInsets.only(top: buttonGap),
              width: 250.0,
              onPressed: goToPage(context, GeoFence()),
              text: 'GeoFence',
            ),
            RowButton(
              mainAlignment: MainAxisAlignment.center,
              margin: EdgeInsets.only(top: buttonGap),
              width: 250.0,
              onPressed: goToPage(context, Settings()),
              text: 'Settings',
            ),
            RowButton(
              mainAlignment: MainAxisAlignment.center,
              margin: EdgeInsets.only(top: buttonGap),
              width: 250.0,
              onPressed: goToPage(context, More()),
              text: 'More',
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // toolbarHeight: screenSize.height * 0.0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Column(
        children: [
          Text(
            'Home',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 24.0,
              color: Theme.of(context).secondaryHeaderColor,
            ),
          ),
          Text(
            'Welcome!',
            style: TextStyle(
              fontFamily: 'GloriaHallelujah',
              fontSize: 17.0,
              fontWeight: FontWeight.w100,
              letterSpacing: 5.0,
              color: Theme.of(context).primaryColorLight,
            ),
            softWrap: true,
          ),
        ],
      ),
      centerTitle: true,
      leading: Transform.scale(
        scale: 0.8,
        child: Image.asset(
          'assets/icons/map_icon.png',
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      actions: [Infobutton()],
    );
  }

  VoidCallback goToPage(BuildContext context, Widget page) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ),
      );
    };
  }
}
