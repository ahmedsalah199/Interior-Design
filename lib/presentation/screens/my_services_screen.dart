import 'package:flutter/material.dart';
import 'package:interior_design/core/utils/strings_manager.dart';

class MyServicesScreen extends StatelessWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(AppStrings.myServicesScreen,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20))),
    );
  }
}
