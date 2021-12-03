import 'package:flutter/material.dart';
class User {
  String email, password;
  String? tokenKey = '';
  int? permission = 0;
  String? userName = '';
  DateTime? timestamp;

  User({
    required this.email,
    required this.password, //not need to save
    this.tokenKey,
    this.permission,
    this.userName,
    this.timestamp,
  });
  Map<String, dynamic> get toJson => {
    'email': email,
    'tokenKey': tokenKey ?? '',
    'permission': this.permission ?? 0,
    'userName': this.userName ?? '',
    'timestamp': this.timestamp ?? DateTime.now(),
  };
  //factory method
  factory User.fromJson(Map<dynamic, dynamic> dictionary) {
    print('haha');
    return User(
        email: dictionary['email'] ?? '',
        password: '',
        tokenKey: dictionary['token'],
        permission: dictionary['email'].trim() == 'hoang@gmail.com' ? 1 : 2,
        userName: dictionary['userName'],
        timestamp: dictionary['timestamp'] ?? DateTime.now()
    );
  }
  static get empty => User(email: '', password: '');
  @override
  //can be "one-line" function
  String toString() => 'email: ${email}, '
      'password: ${password}, '
      'permission: ${permission}, '
      'tokenKey: ${tokenKey}';
}