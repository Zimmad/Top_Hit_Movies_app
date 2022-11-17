import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_mvvm_provider/view_model/auth_view_model.dart';
import 'package:using_mvvm_provider/utils/routes/route_names.dart';
import 'package:using_mvvm_provider/utils/routes/routes.dart';
import 'package:using_mvvm_provider/view_model/user_view_model.dart';

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
          AuthViewModel(context);
        }),
        ChangeNotifierProvider(create: (_) {
          UserViewModel();
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
