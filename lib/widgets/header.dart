import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';

class Header extends StatelessWidget {
  final leftIcon;
  final onPressLeftIcon;

  final rightIcon;
  final onPressRightIcon;

  String? title;

  Header({
    Key? key,
    this.leftIcon,
    this.rightIcon,
    this.onPressLeftIcon,
    this.onPressRightIcon,
    this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftIcon == null ?
            Container(
              width: 50,
              height: 50,
            ) :
            InkWell(
              child: Container(
                child: ClipRRect(
                  child: Image(
                    image: this.leftIcon,
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                    color: MyColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              ),
              onTap: this.onPressLeftIcon,
            ),
            Text(this.title ?? ''),
            rightIcon == null ?
            Container(
                width: 50,
                height: 50,
            ) : InkWell(
              child: Container(
                child: ClipRRect(
                  child: Image(
                    image: rightIcon,
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                    color: MyColors.primary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              ),
              onTap: onPressRightIcon,
            )
          ],
        ),
        height: 50,
    );
  }
}
