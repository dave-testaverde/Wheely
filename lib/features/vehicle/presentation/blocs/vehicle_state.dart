part of 'vehicle_bloc.dart';

abstract class GetAllVehiclesState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllVehiclesInitialState extends GetAllVehiclesState {}

class GetAllVehiclesLoadingState extends GetAllVehiclesState {}

class GetAllVehiclesSuccessState extends GetAllVehiclesState {
  final List<Vehicle> vehicles;
  GetAllVehiclesSuccessState(this.vehicles);

  @override
  List<Object> get props => [vehicles];
}

class GetAllVehiclesErrorState extends GetAllVehiclesState {
  final String message;
  GetAllVehiclesErrorState(this.message);

  @override
  List<Object> get props => [message];
}
