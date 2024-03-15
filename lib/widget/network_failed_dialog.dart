import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_dialog.dart';

Future networkFailedDialog({
  VoidCallback? tryAgainOnTap,
  VoidCallback? cancelOnTap,
}) async {
  return customDialog(
    title: "Connection Failed",
    content: "Check your internet connection",
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: cancelOnTap ??
                () {
                  Get.back(canPop: false);
                },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: tryAgainOnTap ??
                () {
                  Get.back(canPop: false);
                },
            child: Text("Try again"),
          ),
        ],
      )
    ],
  );
}
