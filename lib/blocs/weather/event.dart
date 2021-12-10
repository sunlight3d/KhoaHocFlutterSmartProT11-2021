part of './bloc.dart';
abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherEventGetAll extends WeatherEvent {}

//for fun...
class WeatherEventInsert extends WeatherEvent {}
class WeatherEventUpdate extends WeatherEvent {}