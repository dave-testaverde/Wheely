part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  @override
  List<Object> get props => [];
}

class VehicleInitialState extends VehicleState {}

class VehicleLoadingState extends VehicleState {}

class GetAllVehiclesSuccessState extends VehicleState {
  final List<Vehicle> vehicles;
  GetAllVehiclesSuccessState(this.vehicles);

  @override
  List<Object> get props => [vehicles];
}

class GetDetailsVehicleSuccessState extends VehicleState {
  final Cart cart;
  GetDetailsVehicleSuccessState(this.cart);
}

class VehicleErrorState extends VehicleState {
  final String message;
  VehicleErrorState(this.message);

  @override
  List<Object> get props => [message];
}
