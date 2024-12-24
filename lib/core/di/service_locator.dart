import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:wheely/features/vehicle/domain/usecases/get_all_vehicles.dart';

import '../../features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import '../../features/vehicle/data/repositories/vehicle_repository_impl.dart';
import '../../features/vehicle/domain/repositories/vehicle_repository.dart';
import '../../features/vehicle/domain/usecases/get_vehicle.dart';
import '../../features/vehicle/presentation/blocs/vehicle_bloc.dart';

final sl = GetIt.instance;

init() async {
  // Bloc
  sl.registerFactory<VehicleBloc>(() => VehicleBloc());

  // Use cases
  sl.registerLazySingleton(() => GetVehicle(sl()));
  sl.registerLazySingleton(() => GetAllVehicles(sl()));

  // Repositories
  sl.registerLazySingleton<VehicleRepository>(
    () => VehicleRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<VehicleRemoteDataSource>(
    () => VehicleRemoteDataSourceImpl(sl(), sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Dio());
}
