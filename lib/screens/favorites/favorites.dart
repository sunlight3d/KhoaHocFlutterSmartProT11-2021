import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/screens/favorites/favorite_item.dart';
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
  List<Favorite> _favorites = [
    Favorite(icon: Icons.lock, content: 'Go camping'),
    Favorite(icon: Icons.one_k_outlined, content: 'Go fishing'),
    Favorite(icon: Icons.one_k_plus_rounded, content: 'Play football'),
  ];
  List<Student> _students = [
    Student(
        name: 'Nguyen Duc Hoang',
        email: 'hoang@gmail.com',
        slogan: 'Think first',
        url: 'https://www.thesprucepets.com/thmb/FpAKHIGPMDpX6sHu_Oa2QKaJJzY=/1080x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/33425933_857929994407980_2290790978497282048_n-5b266393eb97de0036658c65.jpg',
    ),
    Student(
      name: 'Nguyedsdfsdn Duc Hoang',
      email: 'hoang@gmail.com',
      slogan: ' as soosn as possible',
      url: 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/147698488-cat-allergies-632x475-112x84.jpg',
    ),
    Student(
      name: 'Nguyeween Duc Hoang',
      email: 'hoang@gmail.com',
      slogan: 'Best quality',
      url: 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/140447576-tips-for-first-30-days-cat-632x475-112x84.jpg',
    ),
    Student(
      name: 'Nguyen Duc Hoang',
      email: 'hoang@gmail.com',
      slogan: 'low price',
      url: 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/99233806-bringing-home-new-cat-632x475.jpg',
    ),
    Student(
      name: 'Nguewe2wyen Duc Hoang',
      email: 'hoang@gmail.com',
      slogan: 'bigger is good',
      url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
    ),
    Student(
      name: 'Nguybfgen Duc Hoang',
      email: 'hoang@gmail.com',
      slogan: 'think differentn',
      url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
    )
  ];
  List<Favorite> get _selectedFavorites => _favorites
      .where((element) => element.isSelected == true)
      .toList();
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
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Header(
                  leftIcon: MyIcons.back,
                  onPressLeftIcon: () {
                    print('onPressLeftIcon');
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
                Container(
                  child: Row(
                    children: [
                      Text('something else...',textAlign: TextAlign.left,),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: _students.length,
                        itemBuilder: (context, index) {
                          Student student = _students[index];
                          return Container(
                            child: Row(
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                    student.url ?? '',
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(student.name, style: TextStyle(fontWeight: FontWeight.bold),),
                                    Row(
                                      children: [
                                        Text('says: '),
                                        Text(student.slogan ?? '',style: TextStyle(color: Colors.red),)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
