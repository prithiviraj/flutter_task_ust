import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/common_widgets/error_widget.dart';
import 'package:flutter_app/common_widgets/loading_widget.dart';
import 'package:flutter_app/constant/Constants.dart';
import 'package:flutter_app/constant/Strings.dart';
import 'package:flutter_app/extensions/Colors+Extension.dart';
import 'package:flutter_app/features/screen3/cubit/screen3_cubit.dart';
import 'package:flutter_app/features/screen3/data/model/screen3_model.dart';
import 'package:flutter_app/features/webview/ui/webview_widget.dart';
import 'package:flutter_app/utils/utils.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class Screen3 extends StatefulWidget {
  @override
  Screen3StateWidget createState() {
    return Screen3StateWidget();
  }
}

class Screen3StateWidget extends State<Screen3> {
  Screen3Cubit screen3Cubit;
  Screen3Model model;

  @override
  void initState() {
    super.initState();
    screen3Cubit = CubitProvider.of<Screen3Cubit>(context);
    screen3Cubit.getDataFromAPI();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 60),
              setView(true),
              setListView(),
              SizedBox(height: 20),
              bottomBtn(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // A function to set the top view
  Widget setView(bool status) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              Strings.screen3_text1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Text(
            Strings.screen3_text2,
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

  // A function to set the bottom view
  Widget bottomBtn() {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: HexColor.fromHex(Strings.bgColor),
                onPrimary: Colors.white,
                side: BorderSide(
                  width: 1.2,
                  color: HexColor.fromHex(Strings.borderColor1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(3.5),
                )),
            child: Text(
              Strings.screen3_btn1,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  // A Function to set the list view
  // When the Model Changed only middle view refresh, other no change.
  Widget setListView() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: CubitConsumer<Screen3Cubit, Screen3State>(
          cubit: screen3Cubit,
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
            if (current is Screen3LoadingState) {
              Utils().showLoaderDialog(context);
              return false;
            } else {
              return true;
            }
          },
          builder: (context, state) {
            print("State-builder->" + state.toString());
            if (state is Screen3InitialState) {
              return buildLoading(true);
            } else if (state is Screen3LoadingState) {
              return buildLoading(true);
            } else if (state is Screen3LoadedState) {
              if (state.model != null) {
                model = state.model;
                return setListViewData(model);
              } else {
                return buildError(Strings.errorLocalMsg);
              }
            } else {
              return buildError(Strings.errorLocalMsg);
            }
          },
        ),
      ),
    );
  }

  ListView setListViewData(Screen3Model model) {
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        shrinkWrap: true,
        itemCount: model.resultList.length,
        itemBuilder: (BuildContext ctx, int position) {
          return getRow(model.resultList[position]);
        });
  }

  Widget getRow(Result data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(link: data.text1),
            ));
      },
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
                  color: HexColor.fromHex(Strings.borderColor2)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 10, top: 18, bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        data.title,
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
                      child: Image.asset(Strings.rightArrowIcon,
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

  Widget buildLoading(bool status) {
    return CustomLoadingWidget();
  }

  Widget buildError(String msg) {
    return CustomErrorWidget(msg: msg);
  }
}
