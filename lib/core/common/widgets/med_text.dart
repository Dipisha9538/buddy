import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MedText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  MedText({super.key, 
  this.color= const Color.fromARGB(255, 161, 158, 158), 
  this.size=16,
  this.height=1.2,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Raleway Regular',
        color: color,
        fontSize: size,
        height: height
      ),
    );
  }
}