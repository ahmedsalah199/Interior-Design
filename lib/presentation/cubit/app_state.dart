part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeIndexBottomNavigationState extends AppState {}

class ChangeSelectedIndexListViewState extends AppState {}

class DifferentServicesLoadingState extends AppState {}

class DifferentServicesSuccessState extends AppState {
  final List<DifferentServicesEntity> services;
  DifferentServicesSuccessState(this.services);
}

class DifferentServicesErrorState extends AppState {
  final String msg;
  DifferentServicesErrorState(this.msg);
}
