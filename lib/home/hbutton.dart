import 'package:flutter/material.dart';

class hbutton extends StatelessWidget {
  hbutton(this.onPressed);

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.explore,
              color: Colors.amber,
            ),
            SizedBox(width: 8.0),
            Text("+Ad", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      shape: const StadiumBorder(),
    );
  }
}