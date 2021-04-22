import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Utils {
  Utils._privateConstructor();

  static final Utils getInstance = Utils._privateConstructor();

  factory Utils() {
    return getInstance;
  }

  showLoaderDialog(BuildContext context) {
    Future.delayed(Duration.zero, () {
      AlertDialog alert = AlertDialog(
        content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(
                margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
          ],
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  dismissLoaderDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
