import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/exceptions.dart';
import '../../core/utils/strings_manager.dart';
import '../models/different_services_model.dart';

abstract class DifferentServicesLocalDataSource {
  Future<List<DifferentServicesModel>> getCachedServices();
  Future<Unit> cacheServices(List<DifferentServicesModel> services);
}

class DifferentServicesLocalDataSourceImpl
    implements DifferentServicesLocalDataSource {
  final SharedPreferences sharedPreferences;
  DifferentServicesLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheServices(List<DifferentServicesModel> services) {
    sharedPreferences.setString(AppStrings.cachedQuotes, jsonEncode(services));
    return Future.value(unit);
  }

  @override
  Future<List<DifferentServicesModel>> getCachedServices() {
    final jsonString = sharedPreferences.getString(AppStrings.cachedQuotes);
    if (jsonString != null) {
      List<DifferentServicesModel> cachedServices = json.decode(jsonString);
      return Future.value(cachedServices);
    } else {
      throw EmptyCacheException();
    }
  }
}
