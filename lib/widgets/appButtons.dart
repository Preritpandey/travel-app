import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  bool? isIcon;
  String? text;
  IconData? appIcon;
  final Color? color;
  final Color backgroundColor;
  double size;
  final Color? borderColor;

  AppButton(
      {super.key,
      this.appIcon,
      this.text = "hii",
      this.isIcon = false,
      required this.size,
      required this.color,
      required this.backgroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isIcon == false
          ? Center(
              child: DefaultTextStyle(
              style: TextStyle(decoration: TextDecoration.none),
              child: Text(
                text!,
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ))
          : Center(child: Icon(appIcon)),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
