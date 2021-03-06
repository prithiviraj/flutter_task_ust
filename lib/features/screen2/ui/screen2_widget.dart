import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/Constants.dart';
import 'package:flutter_app/constant/Strings.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';

class Screen2 extends StatefulWidget {
  @override
  Screen2State createState() {
    return Screen2State();
  }
}

class Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: Constants.isDebugShowCheckedModeBanner,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Visibility(
            visible: false,
            child: AppBar(),
          ),
        ),
        body: Container(
          color: HexColor.fromHex(Strings.bgColor),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  setView(true, 3),
                  SizedBox(height: 20),
                  Divider(color: HexColor.fromHex(Strings.dividerColor)),
                  setView(false, 5),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // A function to set the widget the main view
  Widget setView(bool status, int count) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: status,
            child: Container(
              child: Text(
                Strings.screen2_text1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20),
          Visibility(
            visible: status,
            child: Text(
              Strings.screen2_text2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 20),
          Container(
              width: double.infinity,
              height: 220,
              margin: EdgeInsets.only(right: 20),
              child:
                  Image.asset(Strings.placeHolderIcon, fit: BoxFit.fitWidth)),
          SizedBox(height: 30),
          Container(child: setListView(count)),
        ],
      ),
    );
  }

  // A function to set the list view
  Widget setListView(int count) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          primary: false,
          shrinkWrap: true,
          itemCount: count,
          itemBuilder: (BuildContext ctx, int position) {
            return getRow(position);
          }),
    );
  }

  // A function to bind the row in the list view.
  Widget getRow(int i) {
    int count = i + 1;
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Text(
                  count.toString() + ".",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.start,
                ),
                Text(
                  Strings.screen2_text3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
