import 'package:dio/dio.dart';

import '../../../../core/shared/constants.dart';
import '../models/vehicle_model.dart';

import 'package:http/http.dart' as http;

abstract class VehicleRemoteDataSource {
  Future<VehicleModel> getVehicleById(String id);
  Future<List<VehicleModel>> getAllVehicles();
}

class VehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  final http.Client client;
  final Dio dio;
  
  VehicleRemoteDataSourceImpl(this.client, this.dio);

  @override
  Future<VehicleModel> getVehicleById(String id) async {
    final response = await dio.get(
      Uri.https(
        Constants.apiBaseUrl, 
        Constants.apiVehicleGetSingle+id
      ).toString(),
      options: Options(
        headers: {"x-api-key": Constants.apiKey}
      )
    );
    if (response.statusCode == 200) {
      return VehicleModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load vehicle");
    }
  }

  @override
  Future<List<VehicleModel>> getAllVehicles() async {
    final response = await dio.get(
      Uri.https(
        Constants.apiBaseUrl, 
        Constants.apiVehicleGetAll
      ).toString(),
      options: Options(
        headers: {"x-api-key": Constants.apiKey},
        contentType: Headers.jsonContentType
      ),
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => VehicleModel.fromJson(json))
          .toList();    
    } else {
      throw Exception("Failed to load vehicles");
    }
  }
}
