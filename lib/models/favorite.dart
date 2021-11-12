import 'package:flutter/material.dart';
class Favorite {
  IconData icon;
  String content;
  bool? isSelected = false;

  Favorite({
    required this.icon,
    required this.content,
    this.isSelected,
  });
  @override
  //can be "one-line" function
  String toString() => 'content: ${content}';

}