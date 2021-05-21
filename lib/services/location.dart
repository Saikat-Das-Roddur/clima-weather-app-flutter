import 'package:geolocator/geolocator.dart';

class Location{
  double _latitude;
  double _longitude;


  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  Future<void> getCurrentLocation()async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude = position.latitude;
      _longitude = position.longitude;
      print(position);
    }catch(e){

    }

  }
}