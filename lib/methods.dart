import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'mainScreen.dart';
import 'dart:convert';
Future <Position> getLocation() async{
  Position pos =await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  return pos;
}
Future <http.Response> getData()async{
  Position pos= await getLocation();
  dynamic timeStamp= await http.get('http://api.aladhan.com/v1/currentTimestamp?zone=Europe/London');
  http.Response data=await http.get('http://api.aladhan.com/v1/timings/$timeStamp?latitude=${pos.latitude}&longitude=${pos.longitude}&method=5');
  print(data.body);
  return data;
}

String timeConv(String time){
  int t= int.parse(time.substring(0,2));
  if(t<=11){
    time+=" am";
  }
  else if(t==12){
    time+=" pm";
  }
  else{
    String temp=time.substring(2);
    t-=12;
    String t2=t.toString();
    time=t2+temp+" pm";
  }
  return time;
}

void change(data){
  fajrtime= jsonDecode(data)['data']['timings']['Fajr'];
  dhuhrtime= jsonDecode(data)['data']['timings']['Dhuhr'];
  asrtime= jsonDecode(data)['data']['timings']['Asr'];
  maghribtime= jsonDecode(data)['data']['timings']['Maghrib'];
  ishatime= jsonDecode(data)['data']['timings']['Isha'];
}