import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:untitled1/screens/city_screen.dart';
import 'package:untitled1/services/networking.dart';
import 'package:untitled1/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final networkHelper;

  const LocationScreen({this.networkHelper});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature;
  int condition;
  String cityName;
  WeatherModel weatherModel;

  @override
  void initState() {
    super.initState();
    weatherModel=WeatherModel();
    updateUI(widget.networkHelper);
  }

  updateUI(dynamic weatherData) {
    setState(() {
      if(weatherData == null){
        temperature =0;
        condition = 0;
        cityName = '';
        return;
      }
      temperature = weatherData['main']['temp'];
      condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/weather_background.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0), BlendMode.dstATop)
            )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image(image: AssetImage("images/weather_background.jpg")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    heroTag: "haha",
                    backgroundColor: Colors.transparent,
                    onPressed: () async {
                     var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50,
                      color: Colors.blueGrey,
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    heroTag: "baba",
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }
                      ));
                      if(typedName!=null){
                        var weatherData = await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50,
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      "${temperature.toInt()}°",
                      style: TextStyle(
                          fontSize: 100,
                          color: Colors.amber,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "${weatherModel.getWeatherIcon(condition)}",
                      style: TextStyle(
                          fontSize: 100,
                          color: Colors.amber,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  "${weatherModel.getMessage(temperature.toInt())} in $cityName",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 64,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
