import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/apiClient/rest_client.dart';
import 'package:flutter_app/common_widgets/carousel_widget.dart';
import 'package:flutter_app/common_widgets/error_widget.dart';
import 'package:flutter_app/common_widgets/loading_widget.dart';
import 'package:flutter_app/constant/Constants.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';
import 'package:flutter_app/features/screen1/cubit/screen1_cubit.dart';
import 'package:flutter_app/features/screen1/data/model/screen1_model.dart';
import 'package:flutter_app/features/screen3/cubit/screen3_cubit.dart';
import 'package:flutter_app/features/screen3/data/screen3_repository.dart';
import 'package:flutter_app/utils/utils.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import '../../screen2/ui/screen2_widget.dart';
import '../../screen3/ui/screen2_widget.dart';

class Screen1 extends StatefulWidget {
  @override
  Screen1WidgetState createState() {
    return Screen1WidgetState();
  }
}

class Screen1WidgetState extends State<Screen1> {
  CarouselView carouselView;
  Screen1Cubit screen1Cubit;
  Screen1Model model;
  double leftAlign = 20;

  @override
  void initState() {
    super.initState();
    carouselView = CarouselView(this.carouselIndexCallback);

    screen1Cubit = CubitProvider.of<Screen1Cubit>(context);
    screen1Cubit.getDataFromAPI();
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
          child: Container(
            child: setAllView(context),
          ),
        ),
      ),
    );
  }

  // A Function to set all the widgets
  Widget setAllView(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setView1(),
            Divider(color: HexColor.fromHex("#7E7E7E26")),
            SizedBox(height: 10),
            setView2(),
            SizedBox(height: 40),
            Divider(color: HexColor.fromHex("#7E7E7E26")),
            SizedBox(height: 20),
            setView3(context),
          ],
        ),
      ),
    );
  }

  // A function set the middle view.
  // When the Model Changed only middle view refresh, other no change.
  Widget setView2() {
    return Container(
      margin: EdgeInsets.only(left: leftAlign),
      // Refresh only this widget based on state changed.
      child: CubitConsumer<Screen1Cubit, Screen1State>(
        cubit: screen1Cubit,
        // ignore: missing_return
        listenWhen: (previous, current) {
          // return true/false to determine whether or not
          // to invoke listener with state
          print("Call listenWhen(previous: $previous, current: $current)");
        },
        listener: (context, state) {
          // do stuff here based on bloc state
          print("State-listener->" + state.toString());
        },
        buildWhen: (previous, current) {
          // return true/false to determine whether or not
          // to rebuild the widget with state
          print("Call buildWhen(previous: $previous, current: $current)");
          if (current is Screen1LoadingState) {
            Utils().showLoaderDialog(context);
            return false;
          } else {
            return true;
          }
        },
        builder: (context, state) {
          print("State-builder->" + state.toString());
          if (state is Screen1InitialState) {
            return buildLoading(true);
          } else if (state is Screen1LoadingState) {
            return buildLoading(true);
          } else if (state is Screen1LoadedState) {
            if (state.model != null) {
              model = state.model;
              return Column(
                children: [
                  carouselView.setCarouselPageIndicator(model),
                  carouselView.setCarouselView(model),
                ],
              );
            } else {
              return buildError("Carousel loading error!");
            }
          } else {
            return buildError("Carousel loading error!");
          }
        },
      ),
    );
  }

  // A Function to set the loader widget
  Widget buildLoading(bool status) {
    return CustomLoadingWidget();
  }

  // A function to set the error widget
  Widget buildError(String msg) {
    return CustomErrorWidget(msg: msg);
  }

  // A Function to set the top view
  Widget setView1() {
    return Container(
      margin: EdgeInsets.only(left: leftAlign),
      child: Column(
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
              height: 390,
              margin: EdgeInsets.only(right: 20),
              child:
                  Image.asset("assets/images/image.png", fit: BoxFit.fitWidth)),
        ],
      ),
    );
  }

  // A function to set the bottom view.
  Widget setView3(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: leftAlign),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
      ),
    );
  }

  // A function to set the buttons in the bottom view.
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
                  MaterialPageRoute<Screen1Cubit>(
                    builder: (context) {
                      return CubitProvider(
                        create: (BuildContext context) => Screen3Cubit(
                            MockScreen3Repository(ApiProviderImp())),
                        child: Screen3(),
                      );
                    },
                  ),
                );
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

  // A function call when the carousel swiped.
  void carouselIndexCallback(int index) {
    screen1Cubit.emitLoadedState(model);
  }
}
