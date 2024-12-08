import 'package:flutter/material.dart';

class MessageVehicle {
  showMessage(BuildContext context, String message){
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}