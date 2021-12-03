import 'package:flutter/material.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/repositories/repositories.dart';
import 'package:training_app/utilities/utilities.dart';
class Login extends StatefulWidget {
  //cannot access state(email, password) here !
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = 'hoang@gmail.com';//this is state, internal, private
  String emailError = '';
  String password = 'Abc123456@';//this is state, internal, private
  String passwordError = '';
  //validate !
  /*
    - save data to sqlite: save username/token key
  */
  final _txtEmailController = TextEditingController();
  final _txtPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _txtEmailController.text = email;
    _txtPasswordController.text = password;
  }
  @override
  void dispose() {
    super.dispose();
    _txtEmailController.dispose();
    _txtPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: const Image(
              image: MyImages.wallpaper,
              fit: BoxFit.cover,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.light,
                      fontWeight: FontWeight.bold,
                      fontSize: FontSizes.h2),
                ),
                const SizedBox(height: 20,),
                Stack(
                  children: [
                    Column(
                      children: [
                        TextField(
                          controller: _txtEmailController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: MyColors.light,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (typedText) {
                            email = typedText; //No!, because "state" is immutable
                            setState(() {
                              email = typedText;
                              emailError = isValidEmail(typedText) ? '' : 'Invalid email format';
                            });
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: MyColors.light,
                            ),
                            border: InputBorder.none,
                            hintText: "Enter your email",
                            hintStyle: TextStyle(
                                fontSize: FontSizes.h5, color: MyColors.light),
                          ),
                        ),
                        (emailError == '' || email.length == 0) ? Container(height: 15,) : Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(emailError,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.red
                                  ),),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        const SizedBox(height: 5,),
                        TextField(
                          controller: _txtPasswordController,
                          style: TextStyle(color: Colors.white),
                          cursorColor: MyColors.light,
                          obscureText: true,//display *** when user types
                          enableSuggestions: false,
                          autocorrect: false,
                          onChanged: (typedText) {
                            setState(() {
                              password = typedText;
                              passwordError = password.length > 0 ? '' : 'Password must not be blank';
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: MyColors.light,
                            ),
                            border: InputBorder.none,
                            hintText: "Enter your password",
                            hintStyle: TextStyle(
                                fontSize: FontSizes.h5, color: MyColors.light),
                          ),
                        ),
                        passwordError == '' ? Container(height: 15,) : Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(passwordError,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.red
                                  ),),
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ],
                    ),
                    Positioned(
                      child: InkWell(
                        child: Container(
                          child: Image(
                            image: MyIcons.forward,
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                            color: MyColors.primary,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: MyColors.light,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                Offset(2, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          final isValid = emailError == ''
                              && passwordError == ''
                              && email.trim().length > 0
                              && password.length > 0;
                          if(isValid == true) {
                            UserRepository.instance
                                .login(email: email, password: password)
                                .then((loggedInUser) {
                                  /*
                                  - after login, save user information
                                  (email, id, tokenKey, no PASSWORD) to local storage
                                  - LocalStorage(Native) => SharedPreferences(Android) + CoreData,UserDefault(ios)
                                  - Restart app, check login => navigate to AppTab
                                  * */
                                  /*
                                  Navigator.pushNamed(context,
                                      ScreenNames.favorites,
                                      //for testing
                                      arguments: User(email: email, password: password)
                                  );
                                   */
                                  UserRepository.instance
                                      .saveToLocalStorage(user: User(
                                      email: email,
                                      password: password,
                                      tokenKey: loggedInUser.tokenKey,
                                      permission: loggedInUser.permission,
                                      userName: loggedInUser.userName
                                  )).then((value) {
                                    Navigator.pushNamed(context, ScreenNames.appTab);
                                  }).catchError((error){

                                  });
                                  //sava sqlite => call
                            }).catchError((error) {
                              print('haha');
                            });
                          } else {
                            alert(context: context,
                                title: 'Invalid',
                                content: 'Please input valid email/password'
                            );
                          }

                        },
                      ),
                      right: 20,
                      top: 25,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    InkWell(
                      child: Container(
                        child: Text('Forgot ?',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: MyColors.light, fontSize: FontSizes.h5),),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      ),
                      onTap: () {
                        print('Forgot');
                      },
                    ),
                    SizedBox(width: 20,)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        child: Text('Register',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: MyColors.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSizes.h5),),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      ),
                      onTap: () {
                        print('Register');
                      },
                    )
                  ],
                )
              ],
            ),
            width: screenWidth,
          )
        ],
      ),
    );
  }
}
