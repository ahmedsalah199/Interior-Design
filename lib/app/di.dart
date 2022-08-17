import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:interior_design/presentation/cubit/app_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/network_info.dart';
import '../data/data_sources/different_services_local_data_source.dart';
import '../data/data_sources/different_services_remote_data_source.dart';
import '../data/repositories/different_services_repository_impl.dart';
import '../domain/repositories/different_services_repository.dart';
import '../domain/uses_cases/get_different_services.dart';

final instance = GetIt.instance;

Future<void> init() async {
  // bloc
  instance.registerFactory(() => AppCubit(differentServices: instance()));
  // Uses Cases
  instance.registerLazySingleton(
      () => GetDifferentServices(differentServicesRepository: instance()));
  // repository
  instance.registerLazySingleton<DifferentServicesRepository>(
      () => DifferentServicesRepositoryImpl(
            localDataSource: instance(),
            remoteDataSource: instance(),
            netWorkInfo: instance(),
          ));
  // data sources
  instance.registerLazySingleton<DifferentServicesRemoteDataSource>(
      () => DifferentServicesRemoteDataSourceImpl(client: instance()));
  instance.registerLazySingleton<DifferentServicesLocalDataSource>(() =>
      DifferentServicesLocalDataSourceImpl(sharedPreferences: instance()));
  // core
  instance.registerLazySingleton<NetWorkInfo>(
      () => NetWorkInfoImpl(connectionChecker: instance()));
  // external

  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance.registerLazySingleton<Client>(() => Client());

  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
