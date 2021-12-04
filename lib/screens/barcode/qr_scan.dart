import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:training_app/constants/constants.dart';
import 'package:training_app/constants/images.dart';
import 'package:training_app/models/models.dart';
import 'package:training_app/utilities/utilities.dart';
import 'package:training_app/widgets/header.dart';

class QRScan extends StatefulWidget {
  const QRScan({Key? key}) : super(key: key);

  @override
  _QRScanState createState() => _QRScanState();
}

class _QRScanState extends State<QRScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? _qrcode;
  String? get _barCodeText => _qrcode?.code ?? '';

  QRViewController? _qrViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.widget.updateBarcodeText
    //ModalRoute.of(context)!.settings.arguments
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrViewController?.pauseCamera();
    } else if (Platform.isIOS) {
      _qrViewController?.resumeCamera();
    }
  }
  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    //updateBarcodeText
    ScreenArguments arguments = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    //Function? updateBarcodeText = arguments['updateBarcodeText'] as Function?;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              leftIcon: MyIcons.back,
              title: 'Scan your qr code',
              onPressLeftIcon: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: (QRViewController controller) {
                      _qrViewController = controller;
                      controller.scannedDataStream.listen((qrcode) {
                        // setState(() {
                        //   _qrcode = qrcode;
                        // });
                        if(arguments.updateBarcodeText != null
                            && qrcode.code != '') {
                          arguments.updateBarcodeText!(qrcode.code);
                          Future.delayed(const Duration(milliseconds: 1000), () {
                            Navigator.of(context).pop();
                          });
                        }
                      });
                    },
                    overlay: QrScannerOverlayShape(
                        borderColor: MyColors.primary,
                        borderRadius: 20,
                        borderLength: 30,
                        borderWidth: 10,
                        cutOutSize: scanArea),
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.ac_unit_outlined,
                                  color: Colors.white,
                                ),
                                onTap: () async {
                                  await _qrViewController?.toggleFlash();
                                  setState(() {});
                                },
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.accessibility_new_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    top: 20,
                    left: 10,
                    right: 10,
                  )
                ],
              ),
              flex: 80,
            ),
            Expanded(
              child: Text('Your text : ${_barCodeText}'),
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}
