import 'package:flutter/material.dart';
class Weather {
  String url;
  String content;
  double speed;

  Weather({
    required this.url,
    required this.content,
    required this.speed,
  });
  @override
  String toString() => 'content: ${content}, speed = ${speed}';

}