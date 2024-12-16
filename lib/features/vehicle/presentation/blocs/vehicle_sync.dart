part of 'vehicle_bloc.dart';

Future<void> emitRefreshListVehicle(BuildContext context) async {
  Future state = context.read<VehicleBloc>().stream.first;
  context.read<VehicleBloc>().add(RefreshGetAllVehiclesEvent());
  await state;
}

Future<void> emitNewVehicleDetails(
  ListSlotVehicle widget, Map<String, 
  dynamic> newState
) async {
  Future state = widget.context.read<VehicleBloc>().stream.first;
  widget.context.read<VehicleBloc>().add(
    GetDetailsVehicleEvent(
      Cart(
        id: Uuid().v4(),
        slotFrom: "12:30",
        slotTo: "13:30",
        slotLabel: newState['label']!,
        cost: widget.state.cart.vehicle.cost,
        vehicle: widget.state.cart.vehicle
      )
    )
  );
  await state;
}
