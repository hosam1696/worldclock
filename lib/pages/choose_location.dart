import 'package:flutter/material.dart';
import 'package:worldclock/componnet/locationCard.dart';
import 'package:worldclock/services/time.dart';

class ChooseLocationPage extends StatefulWidget {
  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  WorldTime worldTime = WorldTime(flag: 'asds', location: 'asfs');
  List<dynamic> locations = [];

  Future<List<dynamic>> getLocations() async {
    this.locations = await worldTime.getTimeZones();

    print(locations.length);
    return locations;
  }

  void onPressed() {
    print('location pressed');
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    print('Choose Location Page: InitState');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    print('Choose Location Page: Dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('Widget build');
    print(this.locations.length);
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
        ),
        backgroundColor: Color.fromARGB(250, 230, 230, 230),
        body: Container(
          child: FutureBuilder(
              future: getLocations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemCount: this.locations.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    return LocationCard(
                      location: this.locations[index],
                      onPressed: () {
                        print(this.locations[index]);
                        Navigator.pushReplacementNamed(context, '/',
                            arguments: {'location': this.locations[index]});
                      },
                    );
                  },
//              children: this
//                  .locations
//                  .map((loc) => LocationCard(
//                        location: loc,
//                        onPressed: () {
//                          print(loc);
//                          Navigator.pushReplacementNamed(context, '/',
//                              arguments: {'location': loc});
//                        },
//                      ))
//                  .toList(),
                );
              }
//            child: ListView(
//              padding: EdgeInsets.all(10),
//              children: this
//                  .locations
//                  .map((loc) => LocationCard(
//                        location: loc,
//                        onPressed: () {
//                          print(loc);
//                          Navigator.pushReplacementNamed(context, '/',
//                              arguments: {'location': loc});
//                        },
//                      ))
//                  .toList(),
//            ),
              ),
        ));
  }
}
