import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
