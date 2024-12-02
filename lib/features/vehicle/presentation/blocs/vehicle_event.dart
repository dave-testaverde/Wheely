part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllVehiclesEvent extends VehicleEvent {}
class RefreshGetAllVehiclesEvent extends VehicleEvent {}
class GetDetailsVehicleEvent extends VehicleEvent {}