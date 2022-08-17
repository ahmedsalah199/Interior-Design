import 'package:dartz/dartz.dart';
import 'package:interior_design/domain/repositories/different_services_repository.dart';

import '../../core/error/failures.dart';
import '../entities/different_services_entity.dart';

class GetDifferentServices {
  DifferentServicesRepository differentServicesRepository;
  GetDifferentServices({required this.differentServicesRepository});
  Future<Either<Failure, List<DifferentServicesEntity>>> call() async {
    return await differentServicesRepository.getDifferentServices();
  }
}
