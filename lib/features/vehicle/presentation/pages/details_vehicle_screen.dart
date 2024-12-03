import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/vehicle.dart';
import '../blocs/vehicle_bloc.dart';

class DetailsVehicleScreen extends StatelessWidget {
  final Vehicle vehicle;
  const DetailsVehicleScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleBloc, VehicleState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is VehicleLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.yellowAccent[400]
            ),
          );
        }
        if (state is VehicleErrorState) {
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state is GetDetailsVehicleSuccessState) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.yellowAccent[400],
                child: Stack(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            print("back button");
                          },
                        )
                      ],
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
