import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheely/core/di/service_locator.dart';

import '../../domain/entities/vehicle.dart';
import '../../domain/usecases/get_all_vehicles.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, GetAllVehiclesState> {
  VehicleBloc() : super(GetAllVehiclesInitialState()) {
    on<GetAllVehiclesEvent>(getAllVehiclesEvent);
  }

  FutureOr<void> getAllVehiclesEvent(
    GetAllVehiclesEvent event, 
    Emitter<GetAllVehiclesState> emit
  ) async {
    try {
      emit(GetAllVehiclesLoadingState());
      List<Vehicle> vehicles = await sl<GetAllVehicles>().call();
      emit(GetAllVehiclesSuccessState(vehicles));
    } catch (e) {
      emit(GetAllVehiclesErrorState("Something went wrong!"));
    }
  }
}
