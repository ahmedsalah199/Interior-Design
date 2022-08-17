import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interior_design/app/di.dart' as di;
import 'package:interior_design/presentation/cubit/my_bloc_observer.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  );
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
