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
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
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
