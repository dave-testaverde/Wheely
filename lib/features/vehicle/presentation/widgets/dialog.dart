import 'package:flutter/material.dart';

class DialogVehicle {
  static showInfoDialog(
    BuildContext context
  ){
    return baseDialog(
      context, 
      Text("Please select a time")
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