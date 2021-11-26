import 'package:flutter/material.dart';
class Country {
  String countryName; //Afghanistan
  String code;//KE

  Country({
    required this.countryName,
    required this.code,
  });
  //factory method
  factory Country.fromJson(Map<dynamic, dynamic> dictionary) {
    print('haha');
    return Country(
      countryName: dictionary['xx'] ?? '',
      code: dictionary['yy'] ?? ''
    );
  }
  static get empty => Country(countryName: '', code: '');

  @override
  //can be "one-line" function
  String toString() => 'countryName: ${countryName}, code = ${code}';

}