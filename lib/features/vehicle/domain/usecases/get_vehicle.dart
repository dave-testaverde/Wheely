import '../repositories/vehicle_repository.dart';
import '../entities/vehicle.dart';

class GetVehicle {
  final VehicleRepository repository;

  GetVehicle(this.repository);

  Future<Vehicle> call(String id) {
    return repository.getVehicleById(id);
  }
}