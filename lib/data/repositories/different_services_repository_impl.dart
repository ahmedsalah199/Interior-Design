import 'package:dartz/dartz.dart';
import 'package:interior_design/domain/entities/different_services_entity.dart';
import 'package:interior_design/domain/repositories/different_services_repository.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../data_sources/different_services_local_data_source.dart';
import '../data_sources/different_services_remote_data_source.dart';

class DifferentServicesRepositoryImpl implements DifferentServicesRepository {
  final DifferentServicesRemoteDataSource remoteDataSource;
  final DifferentServicesLocalDataSource localDataSource;
  final NetWorkInfo netWorkInfo;
  DifferentServicesRepositoryImpl(
      {required this.netWorkInfo,
      required this.localDataSource,
      required this.remoteDataSource});
  @override
  Future<Either<Failure, List<DifferentServicesEntity>>>
      getDifferentServices() async {
    if (await netWorkInfo.isNetWorkConnected) {
      try {
        final remoteDate = await remoteDataSource.getDifferentServices();
        localDataSource.cacheServices(remoteDate);
        return Right(remoteDate);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedDate = await localDataSource.getCachedServices();
        return Right(cachedDate);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
