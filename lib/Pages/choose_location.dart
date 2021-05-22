import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/Services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: "Asia/Karachi" , location: 'Karachi' , flag: 'pak.jpg'),
    WorldTime(url: "Asia/Dubai" , location: 'Dubai' , flag: 'dubai.jpg'),
    WorldTime(url: "America/Chicago" , location: 'Chicago' , flag: 'chicago.jpg'),
    WorldTime(url: "America/Belem" , location: 'Belem' , flag: 'belem.jpg'),
    WorldTime(url: "Africa/Nairobi" , location: 'Nairobi' , flag: 'nairobi.png'),
    WorldTime(url: "Africa/Juba" , location: 'Juba' , flag: 'juba.jpg'),
  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build func ran');

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Location'),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
