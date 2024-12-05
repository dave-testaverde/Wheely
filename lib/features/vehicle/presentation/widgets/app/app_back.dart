import 'package:flutter/material.dart';

class AppBack extends StatelessWidget {
  const AppBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.arrow_back, color: Colors.black),
        Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
        Text("Back", style: TextStyle(color: Colors.black, fontSize: 16))
      ]
    );
  }
}
