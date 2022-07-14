import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    // try-catch example. if try fails, then catch renders with default value
    String myMargin = '20';
    try {
      double myMarginAsADouble = double.parse(myMargin);
      return Scaffold(
        body: Container(
          margin: EdgeInsets.all(myMarginAsADouble),
          color: Colors.red,
        ),
      );
    } catch (e) {
      print(e);
    }
    // return Scaffold();
  }
}
