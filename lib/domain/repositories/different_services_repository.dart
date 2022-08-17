import 'package:dartz/dartz.dart';
import 'package:interior_design/domain/entities/different_services_entity.dart';

import '../../core/error/failures.dart';

abstract class DifferentServicesRepository {
  Future<Either<Failure, List<DifferentServicesEntity>>> getDifferentServices();
}
