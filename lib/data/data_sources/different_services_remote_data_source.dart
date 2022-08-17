import 'dart:convert';

import 'package:http/http.dart';

import '../../core/error/exceptions.dart';
import '../../core/utils/constants_manager.dart';
import '../models/different_services_model.dart';

abstract class DifferentServicesRemoteDataSource {
  Future<List<DifferentServicesModel>> getDifferentServices();
}

class DifferentServicesRemoteDataSourceImpl
    implements DifferentServicesRemoteDataSource {
  final Client client;
  DifferentServicesRemoteDataSourceImpl({required this.client});
  @override
  Future<List<DifferentServicesModel>> getDifferentServices() async {
    Response response = await client.get(
        Uri.parse(
          AppConstants.baseUrl + AppConstants.bath,
        ),
        headers: {AppConstants.contentType: AppConstants.applicationJson});
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<DifferentServicesModel> services =
          data.map((data) => DifferentServicesModel.fromJson(data)).toList();
      return services;
    } else {
      throw ServerException();
    }
  }
}
