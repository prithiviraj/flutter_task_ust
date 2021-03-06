import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiClient/rest_client.dart';
import 'package:flutter_app/constant/Strings.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';
import 'package:flutter_app/features/screen1/cubit/screen1_cubit.dart';
import 'package:flutter_app/features/screen1/data/screen1_repository.dart';
import 'package:flutter_app/features/screen1/ui/screen1_widget.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenPage createState() {
    return SplashScreenPage();
  }
}

class SplashScreenPage extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("<---WidgetsBinding--->");
    });
    Timer(Duration(seconds: 1), () => moveToScreen1());
  }

  // A function to navigate to screen1
  void moveToScreen1() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<Screen1Cubit>(
        builder: (context) {
          return CubitProvider(
            create: (BuildContext context) =>
                Screen1Cubit(MockScreen1Repository(ApiProviderImp())),
            child: Screen1(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor.fromHex(Strings.bgColor),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            "Prithivi Assignment",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
