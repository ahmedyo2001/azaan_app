import 'package:azaan_app/methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class mainScreen extends StatefulWidget {
  final http.Response azandata ;
  mainScreen(this.azandata);


  

  @override

  _mainScreenState createState() => _mainScreenState();
}
String fajrtime="4:00";
String dhuhrtime="4:00";
String asrtime="4:00";
String maghribtime="4:00";
String ishatime="4:00";

class _mainScreenState extends State<mainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    change(widget.azandata.body);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.access_time,size: 30,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
                tooltip: 'Refresh',
                onPressed: (){
                setState(() {
                  change(getData());
                });
                },
            ),
          ],
          title: Text(
            "Prayer Timings"
          ),
        ),
        body: Column(
        children: <Widget>[
          ExpandedRow("الفجر",fajrtime),
          ExpandedRow("الظهر",dhuhrtime),
          ExpandedRow("العصر",asrtime),
          ExpandedRow("المغرب",maghribtime),
          ExpandedRow("العشاء",ishatime),
        ],),
      ),
    );
  }
}

class ExpandedRow extends StatelessWidget {
  String prayer;
  String prayertime;
  ExpandedRow(this.prayer,this.prayertime);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[            Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid) ,
              ),
              child: Center(
                child: Text(
                  timeConv(prayertime),style: TextStyle(
                    fontSize: 30
                ),
                ),
              ),
            ),
          ),
            Expanded(
              child: Container(
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid) ,

                  color: Colors.white10
                 ),
                child: Center(
                  child: Text(
                    prayer,style: TextStyle(
                    fontSize: 30
                  ),
                  ),
                ),
              ),
            ),

          ],

      ),
    );
  }
}
