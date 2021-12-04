import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'weather_event.dart';
part 'weather_state.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.httpClient}) : super(WeatherState()) {
    /// TODO: register on<PostFetched> event
  }

  final http.Client httpClient;
}