import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geo_positioning_app/GeoFence.dart';
import 'package:geo_positioning_app/InfoButton.dart';
import 'package:geo_positioning_app/More.dart';
import 'package:geo_positioning_app/MyLocation.dart';
import 'package:geo_positioning_app/Settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final double topGap = 170.0;
  final double buttonGap = 40.0;

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
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: topGap),

              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyLocation();
                    },
                  ),
                );
              },

              'My Location',
            ),
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: buttonGap),

              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GeoFence();
                    },
                  ),
                );
              },

              'GeoFence',
            ),
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: buttonGap),

              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Settings();
                    },
                  ),
                );
              },

              'Settings',
            ),
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: buttonGap),

              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return More();
                    },
                  ),
                );
              },

              'More',
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
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

  Row createButtonRow(
    BuildContext context,
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
          width: 250,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).primaryColorLight,
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }

  void moreButtonPressed() {}

  void myLocationButtonPressed() {}
}
