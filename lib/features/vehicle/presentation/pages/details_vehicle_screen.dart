import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wheely/features/vehicle/presentation/widgets/app/app_back.dart';

import '../../domain/entities/vehicle.dart';
import '../blocs/vehicle_bloc.dart';
import '../widgets/app/app_error.dart';
import '../widgets/app/app_loading.dart';
import '../widgets/message.dart';

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
                      child: SizedBox(
                        width: 400, 
                        height: 605, 
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    child: Image(
                                      image: AssetImage(
                                        'assets/image/scooter${Random().nextInt(6)}.jpg'
                                      )
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 15, left: 15),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(vehicle.model, style: TextStyle(color: Colors.white))
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 14.0, left: 17.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStateProperty.all<Color>(Colors.black)
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.key, color: Colors.white),
                                              Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                                              Text(vehicle.id, style: TextStyle(color: Colors.white, fontSize: 13))
                                            ]
                                          )
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStateProperty.all<Color>(Colors.black)
                                          ),
                                          onPressed: () {
                                            MessageVehicle.showMessage(context, "Contact us for further information");
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.payments, color: Colors.white),
                                              Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                                              Text("Available", style: TextStyle(color: Colors.white, fontSize: 16)),
                                              Text(" today ", style: TextStyle(color: Colors.orangeAccent[400], fontSize: 16, fontWeight: FontWeight.bold)),
                                              Text("from 12:30 to 13:30", style: TextStyle(color: Colors.white, fontSize: 16))
                                            ]
                                          )
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStateProperty.all<Color>(Colors.black)
                                          ),
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.payments, color: Colors.white),
                                              Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                                              Text("Book for ", style: TextStyle(color: Colors.white, fontSize: 16)),
                                              Text("\$${vehicle.cost}", style: TextStyle(color: Colors.orangeAccent[400], fontWeight: FontWeight.bold, fontSize: 16))
                                            ]
                                          )
                                        )
                                      ]
                                    )
                                  ]
                                )
                              )
                            ]
                          )
                        )
                      )
                    )
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
