import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
   data=data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

   //set background
   String bgImage = data['isDaytime']?'Day.png':'Night.png';
   Color bgcolor = data['isDaytime'] ? Colors.blue :Colors.blueGrey[900];

    return Scaffold(
      backgroundColor: bgcolor,
      body:SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/$bgImage'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,420.0,0,0),
              child: Column(
                children:<Widget>[
                  TextButton.icon(
                      onPressed: () async {
                         dynamic result = await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time':result['time'],
                              'location':result['location'],
                              'isDaytime':result['isDaytime'],
                              'flag':result['flag'],
                            };
                          });

                           },
                    icon:Icon(
                        Icons.edit_location,
                       color: Colors.grey[300]
                    ),
                    label: Text(
                      'Edit Location',
                    style: TextStyle(
                        fontFamily: 'Acme',
                        color: Colors.grey[300]
                    ),
                    ),
                  ),
                  SizedBox(height:20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text(
                        data['location'],
                        style:TextStyle(
                          fontSize: 32.0,
                            fontFamily: 'Acme',
                            color: Colors.white,
                            letterSpacing: 2.0
                        )
                      )
                    ]
                  ),
                  SizedBox(height:30.0),
                  Text(
                    data['time'],
                    style:TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 80.0,
                      fontFamily: 'Acme',
                    )
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
