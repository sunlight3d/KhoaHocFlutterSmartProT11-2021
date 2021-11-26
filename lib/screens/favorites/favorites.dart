import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/repositories/repositories.dart';
import 'package:training_app/repositories/student_repository.dart';
import 'package:training_app/repositories/weather_repository.dart';
import 'package:training_app/screens/favorites/favorite_item.dart';
import 'package:training_app/screens/favorites/student_list_item.dart';
import 'package:training_app/screens/favorites/weather_list.dart';
import 'package:training_app/utilities/utilities.dart';
import 'package:training_app/widgets/widgets.dart';

class Favorites extends StatefulWidget {
  //This learn about "simple list"
  /*
  - Map a list of objects => List of Widgets
  - Each widget is a separated component
  - You can multiple select
  - click => show color, press again => unselected
  - done
  * */
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  //map Objects to UI
  //states(not null)
  bool _isLoading = false;
  List<Weather> _weathers = []; //initial state
  List<Student> _students = [];
  String _errorMessage = '';
  List<Favorite> _favorites = [
    Favorite(icon: Icons.lock, content: 'Go camping'),
    Favorite(icon: Icons.one_k_outlined, content: 'Go fishing'),
    Favorite(icon: Icons.one_k_plus_rounded, content: 'Play football'),
  ];

  List<Favorite> get _selectedFavorites => _favorites
      .where((element) => element.isSelected == true)
      .toList();
  @override
  void initState() {
    super.initState();
    setState(() {
      _weathers = WeatherRepository.instance.getWeathers(); //sync
    });
    print('kaka1');
    setState(() {
      _isLoading = true;
    });
    StudentRepository.instance.getStudents(x: 1)
          .then((responseStudents) {
        setState(() {
          print('kaka3');
          _students = responseStudents;
          _isLoading = false;
        });
    }).catchError((errorDetail) {
      //Bam Camping => this code will run ? navigation lesson
      setState(() {
        print('kaka3');
        _students = [];
        _isLoading = false;
        _errorMessage = errorDetail;
        //alert(context: context, title: 'Error', content: _errorMessage);
      });
    }); //async

    print('kaka2');
  }
  @override
  Widget build(BuildContext context) {
    /*
    Modify Header:
    - add Back button
    - title in the Middle
    - add Right button
    Conclusion:
    - You can transmit props as variable/function
    - Flexible UI can be used with blank Container
    * */
    /*
    Design a ListView:
    - Scrollable
    - Data is fetched object's list
    - We will NOT call API now
    - Customize ListItem
    * */
    //final user = ModalRoute.of(context)!.settings.arguments as User;
    if(ModalRoute.of(context)!.settings.arguments is! Null) {
      User? user = ModalRoute.of(context)!.settings.arguments as User;
      //print('email = ${user?.email ?? ''}');
    }

    print('ahah');
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Header(
                  leftIcon: MyIcons.back,
                  onPressLeftIcon: () {
                    //print('onPressLeftIcon');
                    Navigator.pop(context);
                  },
                  rightIcon: MyIcons.menu,
                  onPressRightIcon: () {
                    print('onPressRightIcon');
                  },
                  title: "My Favorites",
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _favorites
                      .map((eachFavorite) => InkWell(
                        child: FavoriteItem(favorite: eachFavorite),
                        onTap:() {
                          //change state
                          print('haha');
                          Navigator.pushNamed(context, ScreenNames.appTab);
                          final List<Favorite> updatedFavorites = _favorites.map((item) {
                            if(item.icon == eachFavorite.icon) {
                              item.isSelected = !(item.isSelected ?? false);
                            }
                            return item;
                          }).cast<Favorite>().toList();

                          setState(() {
                            _favorites = updatedFavorites;
                          });
                          print('selected items: ${_selectedFavorites}');
                        }
                    ,
                  ))
                      .toList(),
                ),
                WeatherList(weathers: _weathers,),
                Container(
                  child: Row(
                    children: [
                      Text('something else...',textAlign: TextAlign.left,),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                    child: _isLoading == true ? Loading(title: 'Loading students')
                    : ListView.builder(
                        itemCount: _students.length,
                        itemBuilder: (context, index) {
                          Student student = _students[index];
                          return InkWell(
                            child: Column(
                              children: [
                                StudentListItem(
                                  student: student,
                                  index: index,
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width - 20,
                                  color: MyColors.primary,
                                )
                              ],
                            ),
                            onTap: () {
                              print('tap to item: ${index}');
                            },
                          );
                        })
                )
              ],
            ),
          ),
        )
    );
  }
}
