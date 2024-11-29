import '../repositories/vehicle_repository.dart';
import '../entities/vehicle.dart';

class GetAllVehicles {
  final VehicleRepository repository;

  GetAllVehicles(this.repository);

  Future<List<Vehicle>> call() {
    return repository.getAllVehicles();
  }
}