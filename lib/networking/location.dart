import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

double latitude = 0.0;
double longitude = 0.0;
// Function to check and request location permission
Future<void> getLocation() async {
  LocationPermission locationPermission = await Geolocator.checkPermission();
  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();
  }
  if (locationPermission == LocationPermission.deniedForever) {
    return;
  }
  if (locationPermission == LocationPermission.whileInUse ||
      locationPermission == LocationPermission.always) {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.low,
    );
    try {
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings());
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  } else {
    print('permission denied');
  }
}

Future getData() async {
  var apiKey = "e951f79329a5aab3abae83d5af3a1785";

  try {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'),
    );
    String data = response.body;
    return jsonDecode(data);
  } catch (e) {
    print(e);
  }
}
