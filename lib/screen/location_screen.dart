import 'package:flutter/material.dart';
import '../utilies/constants.dart';
import 'package:weather/networking/weather.dart';
import 'package:weather/networking/weather.dart';
import 'package:weather/screen/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherdata});
  final weatherdata;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();
  var data='';
  int temperature = 0;
  int condition = 0;
  var conditionData = '';
  var tempData = '';
  String cityName = '';
  var cityNameBack='';
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherdata);
  }

  void updateUI(dynamic weatherdata) {
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      condition = weatherdata['weather'][0]['id'];
      conditionData = weatherModel.getWeatherIcon(condition);
      cityName = weatherdata['name'];
      tempData = weatherModel.getMessage(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      setState(() async{
                         cityNameBack=await Navigator.push(context, MaterialPageRoute(builder: (context){
                           print(cityNameBack);
                           return CityScreen();
                        }));
                         if(cityNameBack != null)
                           {
                             data=await weatherModel.getCityweather(cityNameBack);
                            updateUI(data);
                           }
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      conditionData,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$tempData in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
