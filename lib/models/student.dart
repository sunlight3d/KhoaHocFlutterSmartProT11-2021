import 'package:flutter/material.dart';
class Student {
  String email, name;
  String? url, slogan;

  Student({
    required this.email,
    required this.name,
    this.url,
    this.slogan
  });
  @override
  //can be "one-line" function
  String toString() => 'name: ${name}, email: ${email}';

}