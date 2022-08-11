import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';

// const apiKey = '2f569932d24535d47c70d6c51537ced9';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
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
      WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getLocationWeather();
      // open location screen
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
