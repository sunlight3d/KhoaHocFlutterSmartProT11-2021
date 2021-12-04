import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/utilities/utilities.dart';

class Barcode extends StatefulWidget {
  const Barcode({Key? key}) : super(key: key);
  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
  TextEditingController _txtBarcodeController = TextEditingController();
  String _barcodeText = '';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _txtBarcodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: QrImage(
                      data: _txtBarcodeController.text,
                      version: QrVersions.auto,
                      size: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter code:',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      child: TextField(
                        controller: _txtBarcodeController,
                        style: const TextStyle(color: Colors.black),
                        cursorColor: MyColors.light,
                        onChanged: (typedText) {

                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.one_x_mobiledata_outlined,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "",
                          hintStyle: TextStyle(
                            fontSize: FontSizes.h5,
                            color: Colors.black45,),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Text(
                        'Generate code'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: MyColors.primary
                      ),
                    )
                  ],
                ),
                onTap: () {
                  print('haha');
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 10,),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Text(
                        'Scan code'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: MyColors.primary
                      ),
                    )

                  ],
                ),
                onTap: () {
                  //Intent
                  Navigator.pushNamed(context, ScreenNames.qrScan,
                    arguments: ScreenArguments(updateBarcodeText: (String value) {
                      setState(() {
                        _barcodeText = value;
                      });
                    }),
                  );
                },
              ),
              Text(_barcodeText,
                  style:TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
