import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWhether});
  final locationWhether;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  String cityName;
  String weatherIcon;
  String weatherMessage;
  String weatherBackground = 'images/location_background.jpg';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWhether);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '';
        cityName = '';
        weatherMessage = 'Unable to get data\n';
        return;
      }
      temperature = (weatherData['main']['temp'] - 273.15).toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherData['weather'][0]['main'];
      cityName = weatherData['name'];
      if (cityName == 'Charbagh') cityName = 'Lucknow';
      weatherMessage = weatherModel.getMessage(temperature);
      weatherBackground = weatherModel.getWeatherBackground(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(weatherBackground),
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
                  FlatButton(
                    onPressed: () async {
                      var wheatherData =
                          await weatherModel.getLocationWeather();
                      updateUI(wheatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  Text(
                    cityName,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Spartan MB',
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedCity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedCity != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedCity);
                        updateUI(weatherData);
                      }
                    },
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon  ',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherMessage,
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
