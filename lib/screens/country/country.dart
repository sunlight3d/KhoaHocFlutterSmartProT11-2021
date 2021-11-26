import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/country.dart' as CountryModel;
import 'package:training_app/screens/country/select_country.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final _selectedCountry = CountryModel.Country(countryName: 'Vietnam', code: 'VN');
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text('What is your country'),
              //Inkwell
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(_selectedCountry.countryName),
                      Expanded(child: Container()),
                      Text(_selectedCountry.code),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.ondemand_video,
                        size: 15,
                        color: MyColors.primary,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: MyColors.secondary,
                  ),
                ),
                onTap: () {
                  print('choose country');
                  showDialog(context: context,
                      builder: (BuildContext context) => SelectCountry());
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
