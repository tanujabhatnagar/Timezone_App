import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_project/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

String time='loading';

  void setupWorldTime() async {

  WorldTime instance=WorldTime(location:'Kolkata',flag:'india.png',url: 'Asia/Kolkata');
  await instance.getTime();

  Navigator.pushReplacementNamed(context, '/home',arguments:{
     'location':instance.location,
     'flag':instance.flag,
     'time': instance.time,
    'isDaytime': instance.isDayTime
  });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Padding(
        padding:EdgeInsets.all(50.0),
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
