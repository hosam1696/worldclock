import 'package:flutter/material.dart';
import 'package:worldclock/services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String time = 'Loading...';
  String initLocation = 'Europe/Paris';
  WorldTime worldTime;

  void setupClock() async {
    this.worldTime = WorldTime(location: initLocation, flag: 'london.png');
    await this.worldTime.getTime();
    setTime();
  }

  void setTime() {
    setState(() {
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {'worldTime': this.worldTime});
    });
  }

  void getTime() async {}

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    setupClock();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitPouringHourglass(
      color: Colors.grey,
      size: 50,
    );
    Map navData = ModalRoute.of(context).settings.arguments;

    if (navData != null && navData.isNotEmpty) {
      this.initLocation = navData['location'];
      this.worldTime.changeLocation(this.initLocation);
      print('Init location');
      print(this.initLocation);
    }

    return Scaffold(
      body: SafeArea(
        child: Center(child: spinkit),
      ),
    );
  }
}
