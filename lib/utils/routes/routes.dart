import 'package:flutter/material.dart';
import './route_names.dart';
import '../../view/home_screen.dart';
import '../../view/login_view.dart';
import '../../view/splash_screen.dart';
import '../../view/sign_up_screen.dart';

class Routes {
  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen();
        });
      case RouteNames.logIn:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RouteNames.signUp:
        return MaterialPageRoute(
            builder: ((BuildContext context) => SignUpSceen()));
      case RouteNames.splshScren:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Default Case for Route'),
            ),
            body: Center(
                child: Container(
              color: Colors.red,
            )),
          );
        });
    }
  }
}
