import 'package:flutter/material.dart';
import 'package:travel/misc/appColor.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  bool? isResponsive;
  double? width;
  Button({
    super.key,
    this.width,
    this.isResponsive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.buttonColor,
      ),
      child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceAround
              : MainAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            Icon(
              Icons.fast_forward_outlined,
            ),
          ]),
    );
  }
}
