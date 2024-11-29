import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wheely/features/vehicle/domain/entities/vehicle.dart';

import '../blocs/vehicle_bloc.dart';
import '../widgets/vehicle_card.dart';

class ListVehiclesScreen extends StatelessWidget {
  const ListVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VehicleBloc, GetAllVehiclesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetAllVehiclesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.yellowAccent[400]
            ),
          );
        }
        if (state is GetAllVehiclesErrorState) {
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );
        }
        if (state is GetAllVehiclesSuccessState) {
          return Scaffold(
            body: SafeArea(
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10, 
                            vertical: 5
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            color: Colors.white
                          ),
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
                        ),
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
                    childAspectRatio: 37 / 10,
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children:
                      state.vehicles.map(
                        (vehicles) => _vehiclesItem(vehicles)
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

  Widget _vehiclesItem(Vehicle vehicle) {
    return VehicleCard(vehicle: vehicle);
  }
}
