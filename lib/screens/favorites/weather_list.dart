import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/screens/favorites/favorite_item.dart';
import 'package:training_app/utilities/utilities.dart';
import 'package:training_app/widgets/widgets.dart';

class WeatherList extends StatelessWidget {
  List<Weather> weathers;
  WeatherList({
    Key? key,
    required this.weathers
  }) : super(key: key);
  //fake list

  @override
  Widget build(BuildContext context) {
    //Demo of HorizontalList
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: weathers.length,
          itemBuilder: (context, index) {
            Weather eachWeather = weathers[index];
            return Container(
              width: 90,
              height: 90,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.network(
                        eachWeather.url,
                        width: 30.0,
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                      Text(
                        eachWeather.content,
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                     Text('${eachWeather.speed} m/s', style: TextStyle(color: Colors.white),),
                  ],
                ),
                padding: EdgeInsets.all(10),
              ),
              margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.primary,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        MyColors.primary,
                        MyColors.primary.withOpacity(0.3)
                      ],
                    )
                ),
            );
          }),
    );
  }
}
