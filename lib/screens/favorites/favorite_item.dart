import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/utilities/utilities.dart';

class FavoriteItem extends StatelessWidget {
  final favorite;
  FavoriteItem({this.favorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            //Icon
            this.favorite.icon,
            //Icons.lock,
            color: MyColors.primary,
            size: 20,
          ),
          SizedBox(height: 5,),
          Text(this.favorite.content, style: TextStyle(
              color: MyColors.secondary
          ),)
        ],
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: favorite.isSelected == true ? Border.all(
              color: MyColors.primary,

          ) : null,
      ),
    );
  }
}
