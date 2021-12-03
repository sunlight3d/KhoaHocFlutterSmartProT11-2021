import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/repositories/repositories.dart';
import 'package:training_app/repositories/student_repository.dart';
import 'package:training_app/screens/country/country.dart';
import 'package:training_app/screens/favorites/favorite_item.dart';
import 'package:training_app/screens/favorites/favorites.dart';
import 'package:training_app/screens/favorites/student_list_item.dart';
import 'package:training_app/screens/favorites/weather_list.dart';
import 'package:training_app/screens/profile/profile.dart';
import 'package:training_app/utilities/utilities.dart';
import 'package:training_app/widgets/widgets.dart';
import 'package:training_app/models/country.dart' as CountryModel; //alias
//Bloc = Redux Saga(React)
class AppTab extends StatefulWidget {
  const AppTab({Key? key}) : super(key: key);
  @override
  _AppTabState createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final List<Map<String, dynamic>> _tabs = [
    {
      'text': 'Favorites',
      'icon': const Icon(Icons.euro_symbol),
      'screen': const Favorites(),
    },
    {
    'text': 'Country',
    'icon': const Icon(Icons.assignment),
    'screen': const Country(),
    },
    {
    'text': 'Profile',
    'icon': const Icon(Icons.eleven_mp_sharp),
    'screen': const Profile(),
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: null,
        bottomNavigationBar: Container(
          color: MyColors.primary,
          child: TabBar(
            labelColor: Colors.white,
            //unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(5.0),
            indicatorColor: Colors.white,
            tabs: _tabs.map((eachTab) => Tab(
              text: eachTab['text'],
              icon: eachTab['icon']
            )).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabs.map((eachTab) => eachTab['screen'] as Widget).toList(),
        ),
      ),
    );
  }
}
