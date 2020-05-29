import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final dynamic location;
  Function onPressed = () {};

  LocationCard({this.location, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: FlatButton(
            onPressed: onPressed,
            textColor: Color.fromARGB(200, 100, 100, 100),
            child: Align(alignment: Alignment.topLeft, child: Text(location))),
      ),
    );
  }
}
