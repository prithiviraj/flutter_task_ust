import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/Strings.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';
import 'package:flutter_app/features/screen1/data/model/screen1_model.dart';

class CarouselView {
  Function carouselIndexCallback;
  final CarouselController _controller = CarouselController();
  int _current = 0;

  CarouselView(this.carouselIndexCallback);

  Widget setCarouselPageIndicator(Screen1Model model) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                Strings.screen1_text6,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            setIndicatorView(model),
          ],
        ),
        SizedBox(height: 60),
      ],
    );
  }

  List<Widget> setCarouselListView(Screen1Model model) {
    List<Widget> lines = [];
    for (int i = 0; i < model.resultList.length; i++) {
      lines.add(setSiderContainer(model.resultList[i]));
    }
    return lines;
  }

  Widget setCarouselView(Screen1Model model) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            transform: Matrix4.translationValues(-20, 0.0, 0.0),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  items: setCarouselListView(model),
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

  Container setIndicatorView(Screen1Model model) {
    List<Widget> lines = [];
    for (int i = 0; i < model.resultList.length; i++) {
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

  Container setSiderContainer(Result data) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border.all(
            color: HexColor.fromHex(Strings.carouselColor1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: HexColor.fromHex(Strings.borderColor2)),
      child: Padding(
        padding: const EdgeInsets.only(right: 0, left: 25, top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              data.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 290,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: data.image,
                placeholder: (context, url) =>
                    Image.asset(Strings.placeHolderIcon, fit: BoxFit.fitWidth),
                errorWidget: (context, url, error) =>
                    Image.asset(Strings.placeHolderIcon, fit: BoxFit.fitWidth),
              ),
            ),
            SizedBox(height: 30),
            Text(
              data.text1,
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
                data.text2,
                style: TextStyle(
                    color: HexColor.fromHex(Strings.textColor),
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 50),
            Text(
              data.text3,
              style: TextStyle(
                  color: HexColor.fromHex(Strings.textColor1),
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
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
          Strings.unsel_pageIcon,
        ));
  }

  Container dotSelContainer() {
    return Container(
        width: 8.0,
        height: 8.0,
        margin: EdgeInsets.only(right: 2),
        child: Image.asset(Strings.sel_pageIcon));
  }
}
