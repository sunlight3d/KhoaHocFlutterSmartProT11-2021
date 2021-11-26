import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/country.dart' as CountryModel;
import 'package:training_app/repositories/repositories.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  //states
  var _countries = [];
  bool _isloading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isloading = true;
    CountryRepository.instance.getCountries()
    .then((value){
      setState(() {
        _isloading = false;
        print('aaaaa');
        _countries = value;
      });
    }).catchError((error) {
      setState(() {
        _countries = [];
        _isloading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Select country'),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
            itemCount: _countries.length,
            itemBuilder: (BuildContext context, int index) {
              CountryModel.Country eachCountryObject = _countries[index];
          return GestureDetector(
            child: Container(
              color: index %2 == 0 ? MyColors.light : MyColors.inactive,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eachCountryObject.countryName, style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  Text(eachCountryObject.code),
                  SizedBox(height: 10,)
                ],
              ),
            ),
            onTap: () {

              Navigator.of(context, rootNavigator: true).pop('Discard');
            },
          );
        }),
        decoration: BoxDecoration(

        ),
    ));
  }
}
