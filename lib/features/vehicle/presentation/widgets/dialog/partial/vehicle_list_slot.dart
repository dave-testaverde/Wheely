import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../domain/entities/cart.dart';
import '../../../blocs/vehicle_bloc.dart';
import '../../modal/base_modal.dart';

class ListSlotVehicle extends StatefulWidget {
  const ListSlotVehicle({super.key, required this.slots, required this.context, required this.state});

  final GetDetailsVehicleSuccessState state;
  final List<Map<String, dynamic>> slots;
  final BuildContext context;

  final String slotSelected = "";

  @override
  State<ListSlotVehicle> createState() => _ListSlotVehicleState();
}

class _ListSlotVehicleState extends State<ListSlotVehicle> {
  int slot = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var item in widget.slots)
          InkWell(
            onTap: () => setSlotSelection(item['value']),
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                color: (slot > -1 && slot == item['value']) ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      (item.containsKey('label')) ? item['label'] : "From ${item['from']} to ${item['to']}", 
                      style: TextStyle(
                        color: (slot > -1 && slot == item['value']) ? Colors.white : Colors.black
                      )
                    )
                  ),
                  Radio(
                    activeColor: Colors.yellow[400],
                    value: item['value'],
                    groupValue: slot,
                    onChanged: (value) => setSlotSelection(value)
                  )
                ]
              )
            )
          ),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
            ),
            onPressed: (){
              Navigator.pop(context);
              if(slot > 0) {
                Map<String, dynamic> newState = widget.slots.firstWhere((e) => e['value'] == slot);
                emitNewVehicleDetails(
                  widget.context,
                  Cart(
                    id: Uuid().v4(),
                    date: newState['date'],
                    dateLabel: DateFormat("dd-MM-yyyy").format(newState['date']),
                    slotFrom: newState['from'],
                    slotTo: newState['to'],
                    slotLabel: "From ${newState['from']} to ${newState['to']}",
                    cost: widget.state.cart.vehicle.cost,
                    vehicle: widget.state.cart.vehicle
                  )
                );
              } else {
                if (kDebugMode) {
                  print("Choose day and slot");
                }
                ModalApp.planner(context: widget.context, state: widget.state).showPlanner(null);
              }
            }, 
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Continue", style: TextStyle(color: Colors.white, fontSize: 16)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Icon(Icons.pedal_bike, color: Colors.white)              
              ]
            )
          ),
        )
      ]
    );
  }

  setSlotSelection(int value){
    setState(() {
      slot = value;
      if (kDebugMode) {
        print(slot);
      }
    });
  }

}