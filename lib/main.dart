import 'package:flutter/material.dart';
import 'package:training_app/screens/screens.dart';

//each screen = widget
void main() => runApp(const MyApp()); //one-line function
//1 app has 1 MaterialApp widget
//1 screen has 1 Scaffold widget
//1 screen = 1 .dart file OR 1 folder
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: Welcome(),
      //home: Login(),
      home: Favorites(),
    );
  }
}


