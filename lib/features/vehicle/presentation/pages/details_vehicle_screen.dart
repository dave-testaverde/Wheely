import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheely/features/vehicle/presentation/widgets/app/app_back.dart';

import '../../domain/entities/vehicle.dart';
import '../blocs/vehicle_bloc.dart';
import '../widgets/app/app_error.dart';
import '../widgets/app/app_loading.dart';

class DetailsVehicleScreen extends StatelessWidget {
  final Vehicle vehicle;
  const DetailsVehicleScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleBloc, VehicleState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is VehicleLoadingState) { return AppLoading(); }
        if (state is VehicleErrorState) { return AppError(message: state.message); }
        if (state is GetDetailsVehicleSuccessState) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.yellowAccent[400],
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.goNamed("list_vehicles");
                        },
                        child: AppBack(),
                      )
                    ),
                    Center(
                      child: Text("Vehicle id: ${vehicle.id}")
                    ),
                  ]
                ) 
              )
            )
          );
        }
        return const SizedBox();
      },
    );
  }
}
