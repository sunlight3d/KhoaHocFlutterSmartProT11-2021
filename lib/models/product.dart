import 'package:training_app/utilities/utilities.dart';
class Product {
  String productName; //not null = required
  int year;//not null = required
  DateTime productionDate;
  double price;
  String? description; //nullable

  Product({
    required this.productName,
    required this.year,
    required this.productionDate,
    this.price = 0.0, //default value
    this.description,
    this.doSomething, //only ref, not implement here
  });
  //calculated values.Eg: productionDate => age
  //calculated value = like a Getter

  int get age => yearsBetween(
      from: productionDate,//named parameters
      to: DateTime.now(),
  ); //like property(get) in C#
  //show object's info => override toString()
  @override
  //can be "one-line" function
  String toString() =>
    'productName = $productName,'
            ' year = $year, '
            'date = ${productionDate}, '
            'price = ${price}';
  //function type = delegate in C#, action event/interface in Java
  Function? doSomething;//final doSomething, NOT implement HERE
  //this is "function as a parameter"
}