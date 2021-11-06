import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';

//public
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  _WelcomeState createState() => _WelcomeState();
}
void doXXX() {
  print('do XXX');//implement here !
}
//convert to "Stateless"
//internal, private = _
class _WelcomeState extends State<Welcome> {
  //state = internal property, relating to UI
  //state changed => build() is re-run
  Product? productA;
  //state as a list of objects
  List<Product> _products = [];
  @override
  void initState() {
    super.initState();
    productA = Product(
        productName: 'iphone 4',
        year: 2014,
        price: 512.23,
        productionDate: DateTime(2014, 10, 30),
        doSomething: doXXX
    );
    productA?.doSomething!();
    //state may come from your Server(through API(eg: asp.net web api))
    //let's fake data
    _products = [
      Product(
          productName: 'iphone 4',
          year: 2014,
          price: 512.23,
          productionDate: DateTime(2014, 10, 30)
      ),
      Product(
          productName: 'iphone 3',
          year: 2013,
          price: 333.23,
          productionDate: DateTime(2013, 10, 30)
      ),
      Product(
          productName: 'iphone 5',
          year: 2015,
          price: 5555.23,
          productionDate: DateTime(2015, 10, 30)
      )
    ];
    print('haha');
  }
  //key-value objects = Map
  @override
  Widget build(BuildContext context) {
    //66, 60, 106
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: MyColors.primary
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 100)),
            Text('Welcome', style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),),
            Container(
              child: Text(
                'We put out core routines relatively frequently, but most are shown as bodyweight-only workouts that focus on core conditioning/toning',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            Container(
              child: Image(image: MyImages.welcome),
              padding: EdgeInsets.symmetric(horizontal: 30),
            ),
            InkWell(
              child: Container(
                child: Text('login with Email', textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                    color: MyColors.activeButton,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width - 30*2,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onTap: (){
                print('you press login');
              },
            ),
            Container(
              child: Text('ok'.toUpperCase(), style: TextStyle(
                  fontSize: 18,
                  color: MyColors.inactive
              ),),
              padding: EdgeInsets.symmetric(vertical: 20),
            ),
            InkWell(
              child: Container(
                child: Text('Create a new Account', textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.white//                   <--- border width here
                  ),
                ),
                width: MediaQuery.of(context).size.width - 30*2,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onTap: (){
                print('you press login');
              },
            ),
          ],
        ),
      )
    );
  }
}
