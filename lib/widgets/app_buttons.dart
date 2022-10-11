import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  bool? isIcon;
  final Color backgoundColor;
  final double size;
  final Color borderColor;
   AppButtons({Key? key,
     this.isIcon : false,
    this.text = "Hi",
    this.icon,
    required this.color,
    required this.backgoundColor,
    required this.borderColor,
    required this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
          borderRadius: BorderRadius.circular(15),
          color: backgoundColor),
      child: isIcon ==false? Center(child: AppText(text : text! , color : color)):Center(child: Icon(icon, color: color,)),
    );
  }
}
