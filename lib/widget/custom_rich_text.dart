// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../common/app_color.dart';
import 'my_text_style.dart';

class CustomRichText extends StatelessWidget {
  CustomRichText({
    super.key,
    this.text,
    this.title,
    this.titleClr,
    this.textClr,
    this.titleFw,
    this.textFw,
    this.fSize,
  });
  final String? title;
  final String? text;
  final Color? titleClr;
  final Color? textClr;
  final dynamic fSize;
  final FontWeight? titleFw;
  final FontWeight? textFw;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: "${title ?? ''}",
        style: myTextStyle(
          clr: titleClr ?? tableHeaderClr,
          size: fSize ?? 16.0,
          fw: textFw ?? FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "${text ?? ''}",
            style: myTextStyle(
              clr: textClr ?? Colors.black54,
              size: fSize ?? 16.0,
              fw: textFw ?? FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
