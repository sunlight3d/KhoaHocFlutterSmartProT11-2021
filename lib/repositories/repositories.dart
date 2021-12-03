
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:training_app/models/country.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/utilities/date_time.dart';
part 'country_repository.dart';
part 'user_repository.dart';

//https://api.first.org/data/v1/countries
const baseURL = 'https://api.first.org/';
//const key = "jWXhOdSBDWngVtY7i9";
//const appId = "vWxXencr53KF2t4YjqWGmRjVd7kP15V2U3SN";
Future<dynamic> post({data, url}) async {
  final http.Client httpClient = http.Client();
  try {
    final dictHeaders = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    if(data.containsKey('token') == true) {
      //some api needs "token", some other no(eg: login)
      dictHeaders['Authorization'] = 'Bearer ${data['token']}';
    };
    data.removeWhere((key, value) => key == "token");
    //send data to server
    final response = await httpClient.post(Uri.parse(url),
        headers: dictHeaders,
        body: jsonEncode(data));
    return json.decode(response.body);
  }catch(exception) {
    throw Exception('POST request exception: ${exception.toString()}');
  } finally {
    httpClient.close();
  }
}

Future<dynamic> get({data, url}) async {
  final http.Client httpClient = http.Client();
  try {
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('statusCode not 200');
    }
  }catch(exception) {
    throw Exception('GET request exception: ${exception.toString()}');
  } finally {
    httpClient.close();
  }
}
