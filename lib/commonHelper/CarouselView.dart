import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';

class CarouselView {
  Function carouselIndexCallback;
  final CarouselController _controller = CarouselController();
  int _current = 0;

  CarouselView(this.carouselIndexCallback);

  Widget setCarouselView() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Suspendisse vel.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              setIndicatorView(),
            ],
          ),
          SizedBox(height: 60),
          Container(
            transform: Matrix4.translationValues(-20, 0.0, 0.0),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  items: [
                    //1st Image of Slider
                    setSiderContainer(),
                    //2nd Image of Slider
                    setSiderContainer(),
                    //3rd Image of Slider
                    setSiderContainer(),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 610,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enableInfiniteScroll: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    onPageChanged: onPageChange,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container setIndicatorView() {
    List<Widget> lines = [];
    for (int i = 0; i < 3; i++) {
      if (i == _current) {
        lines.add(dotSelContainer());
      } else {
        lines.add(dotUnSelContainer());
      }
    }
    return Container(
        margin: EdgeInsets.only(right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: lines));
  }

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    print(index);
    _current = index;
    this.carouselIndexCallback(index);
  }

  Container setSiderContainer() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: HexColor.fromHex("#71747B"),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: HexColor.fromHex("#242d36")),
      child: Padding(
        padding: const EdgeInsets.only(right: 0, left: 25, top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "1",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                child: Image.asset("assets/images/image.png",
                    fit: BoxFit.fitWidth)),
            SizedBox(height: 30),
            Text(
              "Lorem Ipsum",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(
                "Dui mattis risus elit purus feugiat quis in sit.",
                style: TextStyle(
                    color: HexColor.fromHex("#A0AEBB"),
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Egestas scelerisque vel.",
              style: TextStyle(
                  color: HexColor.fromHex("#67B4E0"),
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Container dotUnSelContainer() {
    return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.only(right: 2),
        child: Image.asset(
          "assets/images/unsel_page.png",
        ));
  }

  Container dotSelContainer() {
    return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.only(right: 2),
        child: Image.asset("assets/images/sel_page.png"));
  }
}
