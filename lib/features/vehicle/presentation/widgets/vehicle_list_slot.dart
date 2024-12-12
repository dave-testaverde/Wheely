import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListSlotVehicle extends StatefulWidget {
  const ListSlotVehicle({super.key, required this.slots, required this.context});

  final List slots;
  final BuildContext context;

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
          Container(
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
                    (item['label']), 
                    style: TextStyle(
                      color: (slot > -1 && slot == item['value']) ? Colors.white : Colors.black
                    )
                  )
                ),
                Radio(
                  activeColor: Colors.yellow[400],
                  value: item['value'],
                  groupValue: slot,
                  onChanged: (value) {
                    setState(() {
                      slot = value!;
                      if (kDebugMode) {
                        print(slot);
                      }
                    });
                  }
                )
              ]
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

}