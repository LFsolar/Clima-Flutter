import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for decoding json

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    // throw example. throws a specific e to catch
    // void somethingThatExpectsLessThan10(int n) {
    //   if (n > 10) {
    //     throw 'n is greater than 10, n should always be less than 10';
    //   }
    // }
    //
    // try {
    //   somethingThatExpectsLessThan10(12);
    // } catch (e) {
    //   print(e);
    // }

    try {
      Location location = Location();
      await location.getCurrentLocation();
      print('lat: ' + location.lat.toString());
      print('long:' + location.long.toString());
    } catch (e) {
      print(e);
    }
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22'));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);
      int weatherId = decodedData['weather'][0]['id'];
      print('weatherId: ' + weatherId.toString());

      double temp = decodedData['main']['temp'];
      print('temp: ' + temp.toString());

      String cityName = decodedData['name'];
      print('cityName: ' + cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    // try-catch example. if try fails, then catch renders with default value
    // String myMargin = 'abc';
    // double myMarginAsADouble;
    // try {
    //   myMarginAsADouble = double.parse(myMargin);
    // } catch (e) {
    //   print(e);
    // }
    // return Scaffold(
    //   body: Container(
    //     margin: EdgeInsets.all(myMarginAsADouble ?? 30),
    //     color: Colors.red,
    //   ),
    // );
    getData();
    return Scaffold();
  }
}
