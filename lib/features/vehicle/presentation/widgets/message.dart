import 'package:flutter/material.dart';

import 'dialog.dart';

class MessageVehicle {
  static showMessage(
    BuildContext context, 
    String message
  ){
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: Text(message, style: TextStyle(fontSize: 17))
          ),
          InkWell(
            onTap: (){
              DialogVehicle.showInfoDialog(context);
            }, 
            child: Icon(Icons.info, color: Colors.white)
          )
        ],
      ),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}