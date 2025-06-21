import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geo_positioning_app/GeoFence.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final double topGap = 170.0;
  final double buttonGap = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
            onPressed: () => infoButtonPressed(context),
            alignment: Alignment.center,
            iconSize: 40.0,
            icon: Icon(Icons.info),
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ],
      ),
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
              myLocationButtonPressed,
              'My Location',
            ),
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: buttonGap),
              (){
                    Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context){
                        return GeoFence();
                      }
                    )
                  );
              },
              'GeoFence',
            ),
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: buttonGap),
              settingsButtonPressed,
              'Settings',
            ),
            createButtonRow(
              context,
              MainAxisAlignment.center,
              EdgeInsets.only(top: buttonGap),
              moreButtonPressed,
              'More',
            ),
          ],
        ),
      ),
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

  void infoButtonPressed(BuildContext context) {
    showGeneralDialog(
      barrierColor: Theme.of(context).primaryColor,
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


  void settingsButtonPressed() {}

  void moreButtonPressed() {}

  void myLocationButtonPressed() {}
}
