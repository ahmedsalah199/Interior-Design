import 'package:flutter/material.dart';
import 'package:interior_design/app/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.yellow[100],
            unselectedItemColor: Colors.grey),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white),
      ),
      onGenerateRoute: AppRoutes.getRoute,
    );
  }
}
