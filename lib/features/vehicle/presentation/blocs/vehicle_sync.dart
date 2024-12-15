part of 'vehicle_bloc.dart';

Future<void> emitRefreshListVehicle(BuildContext context) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(RefreshGetAllVehiclesEvent());
  await state;
}

Future<void> emitNewVehicleDetails(BuildContext context) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(
    GetDetailsVehicleEvent(
      Cart(
        id: Uuid().v4(),
        slotFrom: "12:30",
        slotTo: "13:30",
        slotLabel: "from 12:30 to 13:30",
        cost: "123,45",
        vehicle: Vehicle(id: "123445", model: "Model Mock", cost: "123,45")
      )
    )
  );
  await state;
}
