import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldclock/services/time.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Map data;
  WorldTime worldTime;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    print('Home Page Dispose');
  }

  @override
  Widget build(BuildContext context) {
    this.data = ModalRoute.of(context).settings.arguments;
    worldTime = data['worldTime'];

    return Scaffold(
      backgroundColor:
          worldTime.time.contains('PM') ? Colors.blueAccent : Colors.white,
//      appBar: AppBar(title: Text('HomePage'),),
      body: Center(
//        padding: const EdgeInsets.all(40.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/${worldTime.time.contains('AM') ? 'day.png' : 'night.png'}'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                worldTime.location,
                style: TextStyle(color: Colors.white, letterSpacing: 1),
              )),
              SizedBox(
                height: 20.0,
              ),
              Center(
                  child: Text(
                worldTime.time,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.white),
              )),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: FlatButton.icon(
                  onPressed: () => {Navigator.pushNamed(context, '/location')},
                  label: Text('Edit Location',
                      style: TextStyle(color: Colors.white, letterSpacing: 1)),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
