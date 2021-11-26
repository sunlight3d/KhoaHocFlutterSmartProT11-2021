import 'package:training_app/models/models.dart';

class WeatherRepository {
  WeatherRepository._privateConstructor();
  static final WeatherRepository instance = WeatherRepository._privateConstructor();
  List<Weather> getWeathers() {
    return [
      Weather(
          url: 'http://openweathermap.org/img/wn/10d@2x.png',
          content: 'few clsasaouds',
          speed: 4
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/04d@2x.png',
          content: 'xlesasar sky',
          speed: 5
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/11d@2x.png',
          content: 'few csasalouds',
          speed: 8
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/50d@2x.png',
          content: 'few csasalouds',
          speed: 9
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/10d@2x.png',
          content: 'few clouds',
          speed: 55
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/10d@2x.png',
          content: 'few clouds',
          speed: 4
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/10d@2x.png',
          content: 'few clouds',
          speed: 22
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/10d@2x.png',
          content: 'few clouds',
          speed: 4
      ),
      Weather(
          url: 'http://openweathermap.org/img/wn/10d@2x.png',
          content: 'few clouds',
          speed: 4
      ),
    ];
  }
}