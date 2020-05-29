import 'package:flutter/material.dart';
import 'package:worldclock/pages/choose_location.dart';
import 'package:worldclock/pages/home.dart';
import 'package:worldclock/pages/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/location': (context) => ChooseLocationPage()
      },
//      home: HomePage(),
    );
  }
}
