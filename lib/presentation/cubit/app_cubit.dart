import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interior_design/core/utils/strings_manager.dart';
import 'package:interior_design/domain/entities/different_services_entity.dart';
import 'package:interior_design/presentation/screens/gallery_screen.dart';
import 'package:interior_design/presentation/screens/home_screen.dart';
import 'package:interior_design/presentation/screens/my_requests_screen.dart';
import 'package:interior_design/presentation/screens/my_services_screen.dart';
import 'package:interior_design/presentation/screens/profile_screen.dart';

import '../../core/error/failures.dart';
import '../../domain/uses_cases/get_different_services.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  GetDifferentServices differentServices;
  AppCubit({required this.differentServices}) : super(AppInitial());

  static AppCubit getCubit(context) => BlocProvider.of(context);

  Future getDifferentServices() async {
    emit(DifferentServicesLoadingState());
    var response = await differentServices();
    response.fold(
        (failure) => emit(DifferentServicesErrorState(failureMsg(failure))),
        (service) {
      emit(DifferentServicesSuccessState(service));
    });
  }

  String failureMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case EmptyCacheFailure:
        return 'Empty Cache Failure';
      default:
        return 'unExpected Failure';
    }
  }

  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const GalleryScreen(),
    const MyServicesScreen(),
    const MyRequestScreen(),
    const ProfileScreen(),
  ];
  List<BottomNavigationBarItem> boBottomNavigationBarItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined), label: AppStrings.homeScreen),
    BottomNavigationBarItem(
        icon: Icon(Icons.image_outlined), label: AppStrings.galleryScreen),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        label: AppStrings.myServicesScreen),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: AppStrings.myRequestsScreen),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_outlined), label: AppStrings.profile),
  ];

  changeIndexBottomNavigation(index) {
    currentIndex = index;
    emit(ChangeIndexBottomNavigationState());
  }

  int selectedIndex = 0;

  changeSelectedIndexListView(index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexListViewState());
  }
}
