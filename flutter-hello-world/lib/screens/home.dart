import 'package:flutter/material.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          "Olá mundo!!!",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ),
    );
  }

}
