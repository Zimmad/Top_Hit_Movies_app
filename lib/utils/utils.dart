import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class Utils {
  static double averageRatings(List<int> ratings) {
    int result = 0;
    for (int i = 0; i < ratings.length; i++) {
      result = result = ratings[i];
    }
    // return (result / ratings.length).truncate();
    return double.parse((result / ratings.length)
        .toStringAsFixed(1)); //When the return type is double.
    // return double.parse(
    //     (result).toStringAsFixed(1)); //When want only 0 after the decimal.
  }

  static void changeFieldFocus(
      {required BuildContext context,
      required FocusNode current,
      required FocusNode next}) {
    // current.requestFocus();
    // current.requestFocus(next);  same as below
    FocusScope.of(context).requestFocus(next);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      gravity: ToastGravity.CENTER,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        title: "Error Message",
        animationDuration: const Duration(seconds: 2),
        duration: const Duration(seconds: 3),
        forwardAnimationCurve: Curves.bounceIn,
        reverseAnimationCurve: Curves.easeInBack,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          color: Colors.black,
          size: 30,
        ),
      )..show(
          context), //! Cascade notation  Cascades (.., ?..) allow you to make a sequence of operations on the same object. In addition to accessing instance members, you can also call instance methods on that same object. This often saves you the step of creating a temporary variable and allows you to write more fluid code.
/*var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0; 
  
  //! Both Above and Below are same.
  var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;

*/
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
      height: 30,
      width: 30,
      color: Colors.blue,
      child: Text(message),
    )));
  }
}
