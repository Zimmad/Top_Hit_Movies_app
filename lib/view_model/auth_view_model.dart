import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:provider/provider.dart';
import '../model/models/user_models.dart';

import '../model/repositories/auth_repository.dart';
import 'package:using_mvvm_provider/utils/routes/route_names.dart';
import 'package:using_mvvm_provider/utils/utils.dart';
import 'package:using_mvvm_provider/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  final authRepo = AuthRepository();
  bool _loading = false;
  bool _signUpLoadinig = false;
  AuthViewModel(BuildContext context);
  bool get loading => _loading;

  bool get signUpLoading {
    return _signUpLoadinig;
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoadinig = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    authRepo.loginApi(data).then((value) {
      final userPrefrences = Provider.of<UserViewModel>(context, listen: false);
      userPrefrences.saveUser(UserModel(token: value['token'].toString()));
      if (kDebugMode) {
        setLoading(true);
        Navigator.pushNamed(context, RouteNames.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(true);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future signUpApi(
    dynamic data,
    BuildContext context,
  ) async {
    authRepo.signUpApi(data).then((value) {
      setSignUpLoading(true);
      Navigator.of(context).pushNamed(RouteNames.home);
    }).onError((error, stackTrace) {
      setSignUpLoading(true);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
      }
    });
  }
}
