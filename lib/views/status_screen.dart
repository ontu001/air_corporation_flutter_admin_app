import 'package:air_corporation/controller/Status_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<StatusController>(builder: (controller) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // status.result?.data?[0].bgColor
                controller.status.result!.data![0].bgColor.toString(),
              ),
              Text(
                controller.status.result!.data![0].textColor.toString(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
