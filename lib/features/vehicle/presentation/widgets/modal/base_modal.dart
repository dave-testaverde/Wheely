import 'package:flutter/material.dart';

import '../../blocs/vehicle_bloc.dart';
import 'partial/planner.dart';

class ModalApp {
  final BuildContext context;
  final GetDetailsVehicleSuccessState state;

  ModalApp.planner({
    required this.context,
    required this.state
  });

  showPlanner(){
    return baseModal(
      context,
      Container(
        height: 200,
        color: Colors.white,
        child: PlannerVehicle(context: context),
      )
    );
  }

  static baseModal(
    BuildContext context, 
    Widget widget
  ){
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: widget,
        );
      }
    );
  }
}