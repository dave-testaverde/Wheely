import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wheely/core/di/service_locator.dart';

import '../../domain/entities/cart.dart';
import '../../domain/entities/vehicle.dart';
import '../../domain/usecases/get_all_vehicles.dart';
import '../widgets/dialog/partial/vehicle_list_slot.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';
part 'vehicle_sync.dart';
part 'vehicle_emit.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(VehicleInitialState()) {
    on<GetAllVehiclesEvent>(getAllVehiclesEvent);
    on<RefreshGetAllVehiclesEvent>(refreshAllVehiclesEvent);

    on<GetDetailsVehicleEvent>(getDetailsVehicleEvent);
  }

  FutureOr<void> getAllVehiclesEvent(
    GetAllVehiclesEvent event, 
    Emitter<VehicleState> emit
  ) async {
    await emitGetAllVehicles(emit);
  }

  FutureOr<void> refreshAllVehiclesEvent(
    RefreshGetAllVehiclesEvent event, 
    Emitter<VehicleState> emit
  ) async {
    await emitGetAllVehicles(emit);
  }

  FutureOr<void> getDetailsVehicleEvent(
    GetDetailsVehicleEvent event, 
    Emitter<VehicleState> emit
  ) async {
    emit(VehicleLoadingState());
    emit(GetDetailsVehicleSuccessState(event.cart));
  }
}
