import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/Constants.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';

class Screen3 extends StatefulWidget {
  @override
  Screen3State createState() {
    return Screen3State();
  }
}

class Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screen3",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 60),
              setView(true),
              setListView(6),
              SizedBox(height: 20),
              bottomBtn(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget setView(bool status) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Fringilla vulputate.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Massa risus.",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget bottomBtn() {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 45,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: FlatButton(
            child: Text(
              "Lorem Ipsum",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
            ),
            onPressed: () {},
            textColor: Colors.white,
            shape: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.0,
                  color: HexColor.fromHex("#0076CE"),
                ),
                borderRadius: new BorderRadius.circular(4.0)),
          ),
        ),
      ),
    );
  }

  Widget setListView(int count) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: true,
            itemCount: count,
            itemBuilder: (BuildContext ctx, int position) {
              return getRow(position);
            }),
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: HexColor.fromHex("#242d36")),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 10, top: 18, bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/images/arrow_right.png",
                          fit: BoxFit.fitWidth),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
