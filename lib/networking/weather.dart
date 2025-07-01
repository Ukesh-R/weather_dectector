
import 'package:weather/networking/location.dart';

class WeatherModel {
  var apiKey = "e951f79329a5aab3abae83d5af3a1785";

  Future<String> getCityweather(String cityNameBack) async
{
  var url='https://api.openweathermap.org/geo/1.0/direct?q=$cityNameBack&limit=1&appid=$apiKey&units=metric';
  var weatherdata=await getData();
  return weatherdata;
}
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for 👕 and shorts';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
