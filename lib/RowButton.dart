import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
  const RowButton({
    super.key,
    required this.mainAlignment,
    required this.margin,
    required this.width,
    required this.onPressed,
    required this.text,
  });

  final MainAxisAlignment mainAlignment;
  final EdgeInsets margin;
  final double width;
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAlignment,
      children: [
        Container(
          margin: margin,
          width: width,
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
}
