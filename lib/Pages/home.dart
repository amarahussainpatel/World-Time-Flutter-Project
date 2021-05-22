import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Map data = {} ;

  Widget build(BuildContext context) {
   data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments ;  //getting arguments from the loading screen
   print(data);

   String isDayTimeImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg' ;
   Color bgColor = data['isDayTime'] ? Colors.lightBlueAccent[100] : Colors.black;
   Color fontColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$isDayTimeImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150.0 , 0 , 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time' : result['time'],
                            'location' : result['location'],
                            'isDayTime' : result['isDayTime'],
                            'flag' : result['flag']
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.white,
                      ),
                      label: Text('Edit Location'),
                      style: TextButton.styleFrom(
                        //backgroundColor: Colors.amberAccent,
                        primary: fontColor,
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data["location"],
                        style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 4.0,
                          color: fontColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 44.0,
                          letterSpacing: 5.0,
                          color: fontColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

