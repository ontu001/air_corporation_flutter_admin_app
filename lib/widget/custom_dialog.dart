import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_style.dart';

Future<dynamic> customDialog({
 
  final Color? confirmButtonClr,
  final Color? cancelButtonClr,
  final String? title,
  final String? content,
  final Widget? body,
  final List<Widget>? actions,
  final bool? onWillPop,
  final VoidCallback? confirmOnTap,
  final VoidCallback? cancelOnTap,
}) {
  return Get.defaultDialog(
    radius: 10.0,
    onWillPop: () async => onWillPop ?? false,
    title: title ?? '',
    content: body ??
        Text(
          "$content",
          style: myTextStyle(size: 16.0),
          textAlign: TextAlign.justify,
        ),
    contentPadding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 16.0),
    titlePadding: EdgeInsets.symmetric(vertical: 20.0),
    actions: actions ??
        <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: cancelOnTap ?? () {},
                child: Text(
                  "NO",
                  style: myTextStyle(clr: Colors.white, size: 14.0),
                ),
                color: cancelButtonClr ?? Colors.red.shade300,
                minWidth: 0.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              MaterialButton(
                onPressed: confirmOnTap ?? () {},
                child: Text(
                  "YES",
                  style: myTextStyle(clr: Colors.white, size: 14.0),
                ),
                color: confirmButtonClr ?? Colors.green.shade300,
                minWidth: 0.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ],
          )
        ],
  );
}
