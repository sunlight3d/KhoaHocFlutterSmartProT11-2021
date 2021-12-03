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
  //state
  var _selectedCountry = CountryModel.Country(countryName: 'Vietnam', code: 'VN');
  void updateSelectedCountry({
    required CountryModel.Country selectedCountry
  }) {
    setState(() {
      _selectedCountry = selectedCountry;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text('What is your country'),
              //Inkwell
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(_selectedCountry.countryName),
                      Expanded(child: Container()),
                      Text(_selectedCountry.code),
                      const SizedBox(width: 5,),
                      const Icon(
                        Icons.ondemand_video,
                        size: 15,
                        color: MyColors.primary,
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: MyColors.secondary,
                  ),
                ),
                onTap: () {
                  showDialog(context: context,
                      builder: (BuildContext context) => SelectCountry(
                          //updateSelectedCountry is a "function ref"
                          updateSelectedCountry: updateSelectedCountry
                      ));
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
