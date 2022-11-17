import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../model/models/user_models.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("token", user.token.toString()); // sp.setString(key, value)

    notifyListeners();

    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString("token");

    return UserModel(token: token.toString());
  }

  void remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
  }
}
