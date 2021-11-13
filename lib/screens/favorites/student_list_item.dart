import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/screens/favorites/favorite_item.dart';
import 'package:training_app/utilities/utilities.dart';
import 'package:training_app/widgets/widgets.dart';

class StudentListItem extends StatelessWidget {
  Student student;//not null
  int index;
  StudentListItem({
    Key? key,
    required this.student,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: index % 2 != 0 ? Row(
        children: [
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
          ),
          SizedBox(width: 10),
          Expanded(child: Container()),
          ClipRRect(
            child: Image.network(
              student.url ?? '',
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(40),
          ),

        ],
      ) : Row(
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
  }
}
