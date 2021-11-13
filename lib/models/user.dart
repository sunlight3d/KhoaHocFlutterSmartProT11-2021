import 'package:flutter/material.dart';
class User {
  String email, password;
  String? tokenKey = '';

  User({
    required this.email,
    required this.password,
    this.tokenKey,
  });
  @override
  //can be "one-line" function
  String toString() => 'email: ${email}, password: ${password}, tokenKey: ${tokenKey}';
}