import '../entities/vehicle.dart';

abstract class VehicleRepository {
  Future<Vehicle> getVehicleById(String id);
  Future<List<Vehicle>> getAllVehicles();
}