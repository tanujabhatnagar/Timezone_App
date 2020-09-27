import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime{

  String location; //location name for UI
  String time; // the time in that location
  String flag;//url to an asset flag icon
  String url; //location url for api endpoints
  bool isDayTime;

  WorldTime({ this.location,this.flag,this.url});

  Future<void> getTime() async {

    try{
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);

      //get properties from data
      String datetime=data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create date time object
      DateTime now=DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set time property
      isDayTime= now.hour>4 && now.hour<18?true:false;
      time=DateFormat.jm().format(now);
    }
    catch(e){
                       print('caught error: $e');
                       time='could not get time data';
    }


  }

}
