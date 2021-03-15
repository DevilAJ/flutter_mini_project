import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '******';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var wheatherData = await networkHelper.getData();
    return wheatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var whetherData = await networkHelper.getData();
    return whetherData;
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

  String getWeatherBackground(int condition) {
    if (condition < 300) {
      return 'images/thunder.jpg';
    } else if (condition < 400) {
      return 'images/drizzle.jpg';
    } else if (condition < 600) {
      return 'images/rain.jpg';
    } else if (condition < 700) {
      return 'images/snow.jpg';
    } else if (condition < 800) {
      return 'images/haze.jpeg';
    } else if (condition == 800) {
      return 'images/sunny.jpg';
    } else if (condition <= 804) {
      return 'images/cloud.jpg';
    } else {
      return 'images/location_background.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time\n';
    } else if (temp > 20) {
      return 'Time for shorts and 👕\n';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤\n';
    } else {
      return 'Bring a 🧥 just in case\n';
    }
  }
}
