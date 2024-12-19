import 'package:flutter/material.dart';

class PlannerVehicle extends StatefulWidget {
  const PlannerVehicle({super.key, required this.context});

  final BuildContext context;

  @override
  State<PlannerVehicle> createState() => _PlannerVehicleState();
}

class _PlannerVehicleState extends State<PlannerVehicle> {

  @override
  Widget build(BuildContext context) {
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: const Text('Select a day'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amberAccent[400]
            ),
            width: 70,
            height: 20,
          )
        ]
      )
    );
  }
}