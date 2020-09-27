import 'package:flutter/material.dart';
import 'package:world_time_project/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
List<WorldTime> locations=[
  WorldTime(url: 'Europe/Paris', location:'Paris', flag: 'france.png'),
  WorldTime(url: 'Europe/London', location:'London', flag: 'united-kingdom.png'),
  WorldTime(url: 'Asia/Tokyo', location:'Tokyo', flag: 'japan.png'),
  WorldTime(url: 'Asia/Singapore', location:'Singapore', flag: 'singapore.png'),
  WorldTime(url: 'Asia/Seoul', location:'Seoul', flag: 'south-korea.png'),
  //WorldTime(url: 'America/New_York', location:'New York', flag: 'united-states-of-america.png'),
  WorldTime(url: 'Asia/Kolkata', location:'Kolkata', flag: 'india.png'),
  WorldTime(url: 'America/Toronto', location:'Toronto', flag: 'united-states-of-america.png'),
  WorldTime(url: 'Asia/Dubai', location:'Dubai', flag: 'united-arab-emirates.png'),
  WorldTime(url: 'Europe/Berlin', location:'Berlin', flag: 'germany.png'),
  WorldTime(url: 'Europe/Dublin', location:'Dublin', flag: 'ireland.png'),
  WorldTime(url: 'Europe/Lisbon', location:'Lisbon', flag: 'portugal.png'),
  WorldTime(url: 'Europe/Rome', location:'Rome', flag: 'italy.png'),
  WorldTime(url: 'Indian/Maldives', location:'Maldives', flag: 'maldives.png'),
  WorldTime(url: 'Australia/Sydney', location:'Sydney', flag: 'australia.png'),
  WorldTime(url: 'Europe/Zurich', location:'Zurich', flag: 'netherlands.png'),
  //WorldTime(url: 'Asia/Kathmandu', location:'Kathmandu', flag: 'nepal.png'),
  //WorldTime(url: 'America/Chicago', location:'Chicago', flag: 'united-states-of-america.png'),
  WorldTime(url: 'Africa/Johannesburg', location:'Johannesburg', flag: 'south-africa.png'),
  WorldTime(url: 'Africa/Nairobi', location:'Nairobi', flag: 'south-africa.png')
];

void updateTime(index) async {
  WorldTime instance=locations[index];
  await instance.getTime();
  //navigate to home screen
  //also pass the data to homepage
  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time': instance.time,
    'isDaytime': instance.isDayTime,

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
          centerTitle: true,
          elevation: 0.0,
      ),
      body:ListView.builder(
          itemCount:locations.length,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child:ListTile(
                  onTap:() {
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location,
                    style: TextStyle(
                      fontFamily: 'Acme',
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage:AssetImage('assets/${locations[index].flag}'),
                  ),
                  ),
              ),
            );
          }
      ),
    );
  }
}
