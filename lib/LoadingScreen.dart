import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'mainScreen.dart';
import 'dart:convert';
import 'methods.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
void nextPage(BuildContext context) async {
  http.Response data = await getData();
  if (data.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => mainScreen(data)),
    );
  }
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Future<void> initState()  {
    // TODO: implement initState
    super.initState();
    nextPage(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      );
  }
}
