import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_style.dart';





customSnackBar({
  required Color bgClr,
  Icon? icon,
  required String msg,
}) {
  Get.rawSnackbar(
    messageText: Row(
      children: [
        Text(
          "${msg}",
          style: myTextStyle(clr: Colors.white, size: 14.0),
        ),
        Spacer(),
        InkWell(
          onTap: () => Get.back(canPop: true),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ],
    ),
    backgroundColor: bgClr,
    margin: EdgeInsets.all(12.0),
    borderRadius: 5.0,
    icon: icon,
  );
}
