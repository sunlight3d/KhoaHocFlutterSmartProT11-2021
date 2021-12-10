import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/blocs/country/bloc.dart';
import 'package:training_app/blocs/simple_bloc_observer.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/screens/screens.dart';

//each screen = widget
void main() {
  BlocOverrides.runZoned
    (() => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver()
  );
}
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
  /*
  Bloc = state management
  - Screens: Favorites, Country, Profile has some shared states
  - Country get data from API, => it will notify Favorites, Profile
  - Favorites, Profile receive notifications => it do somethings
  * */
  @override
  Widget build(BuildContext context) {
    print("aaa");
    return MaterialApp(
      title: 'Traing App',
      initialRoute: '/',
      routes: {
        ScreenNames.welcome: (context) => const Welcome(),
        ScreenNames.login: (context) => Login(),
        ScreenNames.favorites: (context) => const Favorites(),
        ScreenNames.appTab: (context) => AppTab(),
        ScreenNames.qrScan: (context) => const QRScan(),
      },
      home: Welcome(),
      //home: Barcode()
      //home: Login(),
      //home: Welcome(),
      //home: Country(),
      //home:AppTab()
    );
  }
}


