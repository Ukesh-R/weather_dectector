import 'package:flutter/material.dart';
import 'package:weather/screen/location_screen.dart';
import '../utilies/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    var cityValue='';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: null,
            ),
            Container(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color:Colors.grey),
                  decoration: kTextFieldTextStyle,
                  onChanged: (value)
                  {
                     cityValue=value;
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  print(cityValue);
                  Navigator.pop(context,cityValue);
                });
              },
              child: Text(
                'Get Weather',
                style: kButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
