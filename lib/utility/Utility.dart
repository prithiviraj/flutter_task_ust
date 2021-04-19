import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Utility {
  Utility._privateConstructor();

  static final Utility getInstance = Utility._privateConstructor();

  factory Utility() {
    return getInstance;
  }

/*   moveToChatListScreen(BuildContext context) {
    /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatListScreen(
            text: "",
          ),
        )); */
    Navigator.of(context).push(
      MaterialPageRoute<ChatListScreen>(
        builder: (context) {
          return BlocProvider(
            create: (BuildContext context) => ChatlistCubit(),
            child: ChatListScreen(
              text: "",
            ),
          );
        },
      ),
    );
  } */

  showSnackBar(BuildContext context, String msg) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 5),
    ));
  }

  updateSnackBar(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();
  }

  showLoaderDialog(BuildContext context) {
    Future.delayed(Duration.zero, () {
      AlertDialog alert = AlertDialog(
        content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(
                margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
          ],
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  dismissLoaderDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
