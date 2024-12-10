import 'package:flutter/material.dart';

class MessageApp {
  final BuildContext context;
  final String message;
  final Icon? icon;
  final Function? onTapIcon;

  const MessageApp.simpleMessage({
    required this.context, 
    required this.message,
    this.icon,
    this.onTapIcon
  }) : assert(
    (icon == null && onTapIcon == null) || 
    (icon != null && onTapIcon != null), 'Icon and onTapIcon must both be either nullable or non-nullable');

  showMessage(){
    baseMessage(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 7),
            child: Text(message, style: TextStyle(fontSize: 17))
          ),
          (icon != null) ? 
          InkWell(
            onTap: () => onTapIcon!(),
            child: icon
          ) : Container()
        ],
      ),
    );
  }

  baseMessage(
    Widget content
  ){
    final snackBar = SnackBar(
      content: content,
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}