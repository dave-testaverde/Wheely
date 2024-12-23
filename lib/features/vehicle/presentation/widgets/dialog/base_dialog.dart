import 'package:flutter/material.dart';
import 'package:wheely/features/app/factory.dart';

import '../../blocs/vehicle_bloc.dart';
import 'partial/vehicle_list_slot.dart';

class DialogApp {
  final BuildContext context;
  final GetDetailsVehicleSuccessState state;

  DialogApp.selectSlotTime({
    required this.context,
    required this.state
  });

  showInfoDialog(){
    return baseDialog(
      context, 
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                margin: EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  state.cart.dateLabel, 
                  style: TextStyle(color: Colors.white, fontSize: 17)
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15.0),
            child: ListSlotVehicle(
              slots: AppFactory.slots, 
              context: context, 
              state: state
            )
          )
        ]
      )
    );
  }

  static baseDialog(
    BuildContext context, 
    Widget widget
  ){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))
          ),
          content: widget
        ); 
      }
    );
  }
}