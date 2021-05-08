import 'location.dart';
import 'networking.dart';

const apiKey = '8ed2adac82c2f54b294c60bf4932d2e2';
const apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  double longitude, latitude;

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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        apiUrl + '?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    dynamic weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper(apiUrl + '?q=$cityName&appid=$apiKey&units=metric');
    dynamic weatherData = await networkHelper.getData();

    return weatherData;
  }
}
