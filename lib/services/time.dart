import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  String location;
  String time;
  String flag;
  String apiUrl = 'http://worldtimeapi.org/api/timezone/';

  WorldTime({this.location, this.flag});

  Future<void> getTime() async {
    try {
      http.Response res = await http.get(this.apiUrl + this.location);
      Map data = jsonDecode(res.body);
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(data['datetime']);
      now = now.add(Duration(hours: int.parse(offset)));
      this.time = formatTime(now);

      print(this.time);
    } catch (e) {
      print(e);
      this.time = 'Could not get Time Right now.';
    }
  }

  void changeLocation(String loc) async {
    location = loc;
    await this.getTime();
  }

  Future<List<dynamic>> getTimeZones() async {
    try {
      http.Response response = await http.get(this.apiUrl);
//      print(jsonDecode(response.body).runtimeType);
      List<dynamic> locations = jsonDecode(response.body);
      return Future.value(locations);
    } catch (e) {
      print('error');
      return Future.value([]);
    }
  }

  String formatTime(DateTime now) {
    int hour = now.hour > 12 ? now.hour - 12 : now.hour;

    return (hour < 10 ? '0' + hour.toString() : hour.toString()) +
        ':' +
        now.minute.toString() +
        (now.hour >= 12 ? ' PM' : ' AM');
  }

  void updateUrl() {}
}
