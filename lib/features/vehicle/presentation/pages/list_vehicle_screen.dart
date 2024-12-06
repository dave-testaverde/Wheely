import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/vehicle.dart';
import '../blocs/vehicle_bloc.dart';
import '../widgets/app/app_error.dart';
import '../widgets/app/app_loading.dart';
import '../widgets/vehicle_card.dart';

class ListVehiclesScreen extends StatelessWidget {
  const ListVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleBloc, VehicleState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is VehicleLoadingState) { return AppLoading(); }
        if (state is VehicleErrorState) { return AppError(message: state.message); }
        if (state is GetAllVehiclesSuccessState) {
          return Scaffold(
            body: SafeArea(
              bottom: false,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vehicles',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: WidgetStateProperty.resolveWith<double?>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.pressed)) {
                                return 8;
                              }
                              return null;
                            }),
                            backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                            overlayColor: WidgetStateProperty.resolveWith<Color?>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.hovered)) {
                                  return Colors.grey.withValues(alpha: 0.04);
                                }
                                if (states.contains(WidgetState.focused) ||
                                    states.contains(WidgetState.pressed)) {
                                  return Colors.grey.withValues(alpha: 0.12);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () { 
                            _refresh(context);
                          },
                          child: const Row(
                            children: [
                              Text(
                                'UPDATE',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.refresh,
                                color: Colors.black,
                                size: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, 
                        horizontal: 10
                    ),
                    childAspectRatio: 38 / 10,
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children:
                      state.vehicles.map(
                        (vehicles) => _vehiclesItem(vehicles, context)
                      ).toList(),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _vehiclesItem(Vehicle vehicle, BuildContext context) {
    return InkWell(
      onTap: (){ 
        if (kDebugMode) {
          print("Go to details page [context.go('/vehicle/${vehicle.id}')]");
          context.goNamed("details_vehicle", extra: vehicle);
        }
      },
      child: VehicleCard(vehicle: vehicle),
    );
  }

  Future<void> _refresh(BuildContext context) async {
    Future state = context.read<VehicleBloc>().stream.first;
    context.read<VehicleBloc>().add(RefreshGetAllVehiclesEvent());
    await state;
  }
}
