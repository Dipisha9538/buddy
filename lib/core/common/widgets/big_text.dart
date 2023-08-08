import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow; 

  BigText({super.key, 
  this.color= const Color(0xFF332d2b), 
  this.size=0,
  this.overflow=TextOverflow.ellipsis,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Raleway Regular',
        color: color,
        fontSize: size==0?24:size,
        fontWeight: FontWeight.w400
      ),

    );
  }
}