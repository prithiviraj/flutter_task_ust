import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/Constants.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';
import '../../../commonHelper/CarouselView.dart';
import '../../screen2/ui/Screen2.dart';
import '../../screen3/ui/Screen3.dart';

class Screen1 extends StatefulWidget {
  @override
  Screen1State createState() {
    return Screen1State();
  }
}

class Screen1State extends State<Screen1> {
  CarouselView carouselView;

  @override
  void initState() {
    super.initState();
    carouselView = CarouselView(this.carouselIndexCallback);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screen1",
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
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  view1(),
                  carouselView.setCarouselView(),
                  view3(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column view1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80),
        Container(
          child: Text(
            "Frames volutpat.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Name.",
                    style: TextStyle(
                        color: HexColor.fromHex("#A0AEBB"),
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Text(
                    "Euismod.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 20),
                child: Image.asset("assets/images/edit.png",
                    fit: BoxFit.fitWidth)),
          ],
        ),
        Container(
            width: double.infinity,
            height: 420,
            margin: EdgeInsets.only(right: 20),
            child:
                Image.asset("assets/images/image.png", fit: BoxFit.fitWidth)),
      ],
    );
  }

  Column view3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Container(
          child: Text(
            "Sollicitudin in tortor.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Platea sollicitudin platea habitant senectus. Placerat.",
            style: TextStyle(
                color: HexColor.fromHex("#A0AEBB"),
                fontSize: 18.0,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(height: 20),
        setButton(context, "Egestas scleri", 1),
        setButton(context, "Consectur", 2),
      ],
    );
  }

  Column setButton(BuildContext context, String str, int i) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 45,
          margin: EdgeInsets.only(right: 20),
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  str,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/images/arrow_right.png",
                      fit: BoxFit.fitWidth),
                )
              ],
            ),
            onPressed: () {
              if (i == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(),
                    ));
              } else if (i == 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen3(),
                    ));
              }
            },
            textColor: Colors.white,
            shape: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: HexColor.fromHex("#7E7E7E"),
                ),
                borderRadius: new BorderRadius.circular(4.0)),
          ),
        ),
        SizedBox(height: 20)
      ],
    );
  }

  void carouselIndexCallback(int index) {
    setState(() {
      carouselView.setCarouselView();
    });
  }
}
