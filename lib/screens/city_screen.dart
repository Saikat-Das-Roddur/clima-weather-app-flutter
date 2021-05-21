import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("City"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body:Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/city_background.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0), BlendMode.dstATop)
              )
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value){

                        cityName = value;

                    },
                    style: TextStyle(
                      color: Colors.black
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                FlatButton(onPressed: (){
                  Navigator.pop(context, cityName);
                },
                child: Text("Get Weather",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
