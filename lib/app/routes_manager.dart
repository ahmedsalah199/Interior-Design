import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interior_design/app/di.dart' as di;
import 'package:interior_design/presentation/screens/gallery_screen.dart';
import 'package:interior_design/presentation/screens/home_screen.dart';
import 'package:interior_design/presentation/screens/layout_screen.dart';
import 'package:interior_design/presentation/screens/my_requests_screen.dart';
import 'package:interior_design/presentation/screens/profile_screen.dart';

import '../core/utils/strings_manager.dart';
import '../presentation/cubit/app_cubit.dart';

class Routes {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String galleryRoute = '/gallery';
  static const String myServicesRoute = '/myServices';
  static const String myRequestsRoute = '/myRequests';
  static const String profileRoute = '/profile';
}

class AppRoutes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => di.instance<AppCubit>(),
                  child: const LayoutScreen(),
                ));
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.galleryRoute:
        return MaterialPageRoute(builder: (_) => const GalleryScreen());
      case Routes.myServicesRoute:
        return MaterialPageRoute(builder: (_) => const MyRequestScreen());
      case Routes.myRequestsRoute:
        return MaterialPageRoute(builder: (_) => const MyRequestScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(child: Text(AppStrings.noScreenFound)),
            ));
  }
}
