import 'package:flutter/material.dart';
import 'package:worldtime/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override


  void getTime () async {
    WorldTime instance = WorldTime(location: 'Karachi' , flag: 'Pak.jpg' , url: 'Asia/Karachi');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });

  }


  void initState() {
    super.initState();
    print("Init func ran");
    getTime();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,

        ),
      ),
    );
  }
}
