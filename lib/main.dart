import 'package:flutter/cupertino.dart';
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
  const Home({super.key});

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
            onPressed: () => infoButtonPressed(context),
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
            settingsButtonPressed,
            'Settings',
          ),
          createButtonRow(
            MainAxisAlignment.center,
            EdgeInsets.only(top: buttonGap),
            moreButtonPressed,
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

  void infoButtonPressed(BuildContext context) {
    showGeneralDialog(
      barrierColor: Colors.black.withAlpha(125),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 400, 0.0),
          child: Opacity(opacity: a1.value, child: buildInfoPopup()),
        );
      },
      transitionDuration: Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Text('PAGE BUILDER');
      },
    );
  }

  AlertDialog buildInfoPopup() {
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Text('Info/General Help'),
      content: SizedBox(
        height: 400.0,
        child: CupertinoScrollbar(
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: buildInfoTextBox(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInfoTextBox() {
    List<Widget> textBoxWidgets = [];

    double verticalMargin = 10.0;

    Container para1 = Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Text(
        "Lalalalala info info info.\n" +
            "Here's an example on how to use the app!\n" +
            "This app is really cool.\n" +
            "roblox (robocop)",
      ),
    );

    Container gif1 = Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Image.asset(
        'assets/gifs/Screen_Recording_20250619_212522_Roblox.gif',
      ),
    );

    Container para2 = Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      child: Text(
        'Roblox lmao' +
            'wwdwadwdawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaads' +
            'wasdwarwwwwdwadwdawaddwaadswwdwadwdawaddwaadsdwadwdawaddwaadswwdwadw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
            'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw',
      ),
    );

    textBoxWidgets.add(para1);
    textBoxWidgets.add(gif1);
    textBoxWidgets.add(para2);

    return textBoxWidgets;
  }

  void geoFenceButtonPressed() {}

  void settingsButtonPressed() {}

  void moreButtonPressed() {}

  void myLocationButtonPressed() {}
}
