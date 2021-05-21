
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/screens/location_screen.dart';
import 'package:untitled1/services/location.dart';
import 'package:untitled1/services/networking.dart';
import 'package:untitled1/services/weather.dart';

const appId = "cca530041e9a3b32cb7a6c0d383c2daf";
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location;
  @override
  void initState() {
    super.initState();
    getLocationData();

  }

  getLocationData() async{
   WeatherModel weatherModel = WeatherModel();
   var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return LocationScreen(networkHelper: weatherData,);
    }
    ));

    // print(temperature);
    // print(condition);
    // print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }
}
