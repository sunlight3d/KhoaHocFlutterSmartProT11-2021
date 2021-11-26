import 'package:flutter/material.dart';

void alert({required context, required title, required content}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          InkWell(
            child: Text('Close'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}