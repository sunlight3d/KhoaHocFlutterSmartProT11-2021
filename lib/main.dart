import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/screens/screens.dart';

//each screen = widget
void main() => runApp(const MyApp()); //one-line function
//1 app has 1 MaterialApp widget
//1 screen has 1 Scaffold widget
//1 screen = 1 .dart file OR 1 folder
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  /*
  - Calendar, combo-box => dang popup list.VD: chon quoc gia
  - Group button.Eg: Choose Gender && choose other radio buttons
  * */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traing App',
      initialRoute: '/',
      routes: {
        ScreenNames.welcome: (context) => const Welcome(),
        ScreenNames.login: (context) => Login(),
        ScreenNames.favorites: (context) => const Favorites(),
        ScreenNames.appTab: (context) => const AppTab(),
        ScreenNames.qrScan: (context) => const QRScan(),

      },
      //home: Welcome(),
      home: Barcode()
      //home: Login(),
      //home: Welcome(),
      //home: Country(),
      //home:AppTab()
    );
  }
}


