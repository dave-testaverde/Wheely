import '../../../../core/shared/constants.dart';
import '../models/vehicle_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class VehicleRemoteDataSource {
  Future<VehicleModel> getVehicleById(String id);
  Future<List<VehicleModel>> getAllVehicles();
}

class VehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  final http.Client client;

  VehicleRemoteDataSourceImpl(this.client);

  @override
  Future<VehicleModel> getVehicleById(String id) async {
    final response = await client.get(
      Uri.https(
        Constants.apiBaseUrl, 
        Constants.apiVehicleGetSingle+id
      ),
      headers: {"x-api-key": Constants.apiKey}
    );
    if (response.statusCode == 200) {
      return VehicleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load vehicle");
    }
  }

  @override
  Future<List<VehicleModel>> getAllVehicles() async {
    final response = await client.get(
      Uri.https(
        Constants.apiBaseUrl, 
        Constants.apiVehicleGetAll
      ),
      headers: {"x-api-key": Constants.apiKey}
    );
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((json) => VehicleModel.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to load vehicles");
    }
  }
}
