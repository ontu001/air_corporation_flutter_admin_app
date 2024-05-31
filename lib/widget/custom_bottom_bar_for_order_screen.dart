import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/Status_controller.dart';
import 'custom_button.dart';

class CustomBottomForOrderScreen extends StatefulWidget {
  final Function(String) onStatusSelected;

  CustomBottomForOrderScreen({required this.onStatusSelected});

  @override
  State<CustomBottomForOrderScreen> createState() => _CustomBottomForOrderScreenState();
}

class _CustomBottomForOrderScreenState extends State<CustomBottomForOrderScreen> {
  StatusController statusController = Get.put(StatusController());
  String? selectedStatus;

  @override
  void initState() {
    statusController.fetchStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.maxFinite,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: statusController.status.result?.data?.length ?? 0,
        itemBuilder: (context, index) {
          final status = statusController.status.result?.data?[index].name.toString();
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: CustomButton(
              onTap: () {
                widget.onStatusSelected(statusController.status.result?.data?[index].name ?? '');
              },
              title: statusController.status.result?.data?[index].name.toString(),// Add visual feedback for selected status
            ),
          );
        },
      ),
    );
  }
}