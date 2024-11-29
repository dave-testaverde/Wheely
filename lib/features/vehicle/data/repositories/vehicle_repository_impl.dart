import '../../domain/entities/vehicle.dart';
import '../../domain/repositories/vehicle_repository.dart';
import '../datasources/vehicle_remote_data_source.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleRemoteDataSource remoteDataSource;

  VehicleRepositoryImpl(this.remoteDataSource);

  @override
  Future<Vehicle> getVehicleById(String id) async {
    return remoteDataSource.getVehicleById(id);
  }

  @override
  Future<List<Vehicle>> getAllVehicles() async {
    return remoteDataSource.getAllVehicles();
  }
}
