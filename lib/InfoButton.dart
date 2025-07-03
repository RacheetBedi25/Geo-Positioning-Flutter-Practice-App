import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Infobutton extends StatelessWidget {
  const Infobutton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => infoButtonPressed(context),
      alignment: Alignment.center,
      iconSize: 40.0,
      icon: Icon(Icons.info),
      color: Theme.of(context).secondaryHeaderColor,
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

  Widget buildInfoPopup() {
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
        "Lalalalala info info info.\n" "Here's an example on how to use the app!\n" "This app is really cool.\n" "roblox (robocop)",
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
        'Roblox lmao' 'wwdwadwdawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaads' 'wasdwarwwwwdwadwdawaddwaadswwdwadwdawaddwaadsdwadwdawaddwaadswwdwadw' 'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' 'dawaddwaadswwdwadwdawaddwaadswwdwadwdawaddwaadsdawsdw' +
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
}
