import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double long;

  Future<void> getCurrentLocation() async {
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
      lat = position.latitude;
      long = position.longitude;
      // print(position);
    } catch (e) {
      print(e);
    }
  }
}
