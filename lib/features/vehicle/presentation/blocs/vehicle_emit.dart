part of 'vehicle_bloc.dart';

emitGetAllVehicles(Emitter<VehicleState> emit) async {
  try {
    emit(VehicleLoadingState());
    List<Vehicle> vehicles = await sl<GetAllVehicles>().call();
    emit(GetAllVehiclesSuccessState(vehicles));
  } catch (e) {
    emit(VehicleErrorState("Something went wrong!"));
  }
}