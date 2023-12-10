import 'package:flutter/material.dart';
import 'package:world_time_project/pages/choose_location.dart';
import 'package:world_time_project/pages/home.dart';
import 'package:world_time_project/pages/loading.dart';

void main() => runApp(MaterialApp(
debugShowCheckedModeBanner:false,
  routes: {
    '/':(context) => Loading(),
    '/home':(context) =>Home(),
    '/location':(context) =>ChooseLocation(),
  },
  ));

