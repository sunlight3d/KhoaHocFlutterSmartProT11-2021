import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/repositories/repositories.dart';
import 'package:training_app/repositories/student_repository.dart';
import 'package:training_app/screens/favorites/favorite_item.dart';
import 'package:training_app/screens/favorites/student_list_item.dart';
import 'package:training_app/screens/favorites/weather_list.dart';
import 'package:training_app/utilities/utilities.dart';
import 'package:training_app/widgets/widgets.dart';
//Bloc = Redux Saga(React)
class AppTab extends StatefulWidget {
  const AppTab({Key? key}) : super(key: key);
  @override
  _AppTabState createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {
  @override
  Widget build(BuildContext context) {
    print('app tab');
    return Container(
      child: Center(
        child: Text('hahaha'),
      ),
    );
  }
}
