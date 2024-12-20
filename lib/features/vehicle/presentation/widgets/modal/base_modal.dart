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

  showPlanner(Widget? widget){
    return baseModal(
      context,
      Container(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        color: Colors.white,
        child: Planner.build(context, state, widget)
      )
    );
  }

  baseModal(
    BuildContext context, 
    Widget widget
  ){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: widget
        );
      }
    );
  }
}