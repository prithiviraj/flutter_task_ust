import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomErrorWidget extends StatelessWidget {
  final String msg;
  const CustomErrorWidget({Key key, @required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: true,
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                msg,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
