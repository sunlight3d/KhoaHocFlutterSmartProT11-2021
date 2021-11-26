part of 'repositories.dart';

const urlGetCountries = '${baseURL}data/v1/countries';
class CountryRepository {
  CountryRepository._privateConstructor();
  static final CountryRepository instance = CountryRepository._privateConstructor();

  Future<List<Country>> getCountries() async {
    /*
    - Get country from GET api
    - Display country list
    - After select 1 country, dismiss popup, show selected country
     * */
    try {
      List<Country> countries = [];
      final Map<String, dynamic> inputData = Map(); //parameters
      //inputData['x'] = 1;
      final json = await get(url: urlGetCountries, data: inputData);
      //map json => Object
      /*
      if(json['status'].toLowerCase()=='ok') {
        countries = List<Country>.from((json['data'].keys).map((key) {
          print('jaja');
          /*
          2 methods:
          - convert json here(if simple)
          - use fromJSON
          */
          //return Country.fromJson(json['data'][key]);
          return Country(countryName: json['data'][key]['country'], code: key);
        }).toList());
      }
       */
      if(json['status'].toLowerCase()=='ok') {
        countries = List<Country>.from((json['data'].keys)
            .map((key) => Country(countryName: json['data'][key]['country'], code: key))
            .toList());
      }
      print('aaa');
      return countries;
    }catch(e) {
      throw Exception('Cannot get countries');
    }
  }
}