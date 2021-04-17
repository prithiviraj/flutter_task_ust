import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/Constants.dart';
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
      title: "Screen2",
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
          color: HexColor.fromHex("#141D28"),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  view(true, 3),
                  SizedBox(height: 20),
                  Divider(color: HexColor.fromHex("#7E7E7E26")),
                  view(false, 5),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget view(bool status, int count) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: status,
            child: Container(
              child: Text(
                "Pellentesque nulla enim sed.",
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
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis praesent lorem egestas tellus orci leo.",
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
                  Image.asset("assets/images/image.png", fit: BoxFit.fitWidth)),
          SizedBox(height: 30),
          Container(child: setListView(count)),
        ],
      ),
    );
  }

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
                  "Mus sed at ligula.",
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
