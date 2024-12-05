import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent[400],
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.black
        ),
      )
    );
  }
}
