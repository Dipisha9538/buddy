import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({super.key, 
  this.color= const Color.fromARGB(255, 135, 131, 129), 
  this.size=12,
  this.height=1.2,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Raleway SemiBold',
        color: color,
        fontSize: size,
        height: height
      ),
    );
  }
}