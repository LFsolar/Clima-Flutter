import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../utilities/keys.dart' as Keys;

import '../services/location.dart';

const apiKey = Keys.apiKey;

// const apiKey = '2f569932d24535d47c70d6c51537ced9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
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
    //

    try {
      Location location = Location();
      await location.getCurrentLocation();
      lat = location.lat;
      long = location.long;

      NetworkHelper networkHelper = NetworkHelper(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');

      var weatherData = await networkHelper.getData();
    } catch (e) {
      print(e);
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
    return Scaffold();
  }
}
