import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../model/models/user_models.dart';
import 'package:using_mvvm_provider/utils/routes/route_names.dart';

import './user_view_model.dart';

class SplashServices {
  Future<dynamic> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token.toString() == 'null' ||
          value.token.toString() == '' ||
          value.token == null) {
        Navigator.pushNamed(context, RouteNames.logIn);
      } else {
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace);
      }
    });
  }
}
