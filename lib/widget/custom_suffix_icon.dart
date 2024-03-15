
import 'package:flutter/material.dart';

import 'my_text_style.dart';



class CustomSuffixIcon extends StatelessWidget {
 CustomSuffixIcon({
    super.key,
    this.icon,
    this.textValue,
  });
  late final IconData? icon;
  late final String? textValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Positioned(
            top: -5,
        
            right: -5,

            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: Text(
                '$textValue',
                style: myTextStyle(clr: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}