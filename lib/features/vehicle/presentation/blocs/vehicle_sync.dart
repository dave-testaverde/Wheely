part of 'vehicle_bloc.dart';

Future<void> emitRefreshListVehicle(BuildContext context) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(RefreshGetAllVehiclesEvent());
  await state;
}

Future<void> emitNewVehicleDetails(
  BuildContext context, 
  Cart cart,
) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(GetDetailsVehicleEvent(cart));
  await state;
}
