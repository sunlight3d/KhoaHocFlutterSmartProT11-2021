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
    final aCountryObject = CountryModel.Country(countryName: "aff", code: 'dd');
  }
  @override
  Widget build(BuildContext context) {
    print('app tab');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: null,
        bottomNavigationBar: Container(
          color: MyColors.primary,
          child: TabBar(
            labelColor: Colors.white,
            //unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Favorites",
                icon: Icon(Icons.euro_symbol),
              ),
              Tab(
                text: "Country",
                icon: Icon(Icons.assignment),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Favorites(),
            Country()
          ],
        ),
      ),
    );
  }
}
