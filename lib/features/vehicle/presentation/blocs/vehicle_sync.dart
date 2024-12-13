part of 'vehicle_bloc.dart';

Future<void> emitRefreshListVehicle(BuildContext context) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(RefreshGetAllVehiclesEvent());
  await state;
}

Future<void> emitNewVehicleDetails(BuildContext context) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(
    GetDetailsVehicleEvent(Vehicle(id: "123445", model: "Model Mock", cost: "123,45"))
  );
  await state;
}
