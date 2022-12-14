import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/auth_view_model.dart';
import '../utils/routes/route_names.dart';
import '../utils/routes/routes.dart';
import '../view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return AuthViewModel(context);
        }),
        ChangeNotifierProvider(create: (_) {
          return UserViewModel();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteNames.splshScren,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
