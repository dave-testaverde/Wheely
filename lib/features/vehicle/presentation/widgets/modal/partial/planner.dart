import 'package:flutter/material.dart';

import '../../../blocs/vehicle_bloc.dart';
import '../../picker.dart';

class Planner {

  static Widget build(
    BuildContext context, 
    GetDetailsVehicleSuccessState state,
    Widget? widget
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              elevation: WidgetStateProperty.resolveWith<double?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return 8;
                }
                return null;
              }),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.grey.withValues(alpha: 0.04);
                  }
                  if (states.contains(WidgetState.focused) ||
                      states.contains(WidgetState.pressed)) {
                    return Colors.grey.withValues(alpha: 0.12);
                  }
                  return null;
                },
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 19,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )
                )
              ]
            )
          ),
          VehiclePicker(context: context, state: state),
          (widget != null) ? widget : Container() 
        ]
      )
    );
  }
}