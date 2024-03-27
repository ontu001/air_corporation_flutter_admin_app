import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Status_controller.dart';
import '../widget/custom_bottom_sheet.dart';
import '../common/app_color.dart';
import '../common/constant.dart';

class OrderStatus extends StatefulWidget {
  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  StatusController statusController = Get.put(StatusController());

  TextEditingController _nameController = TextEditingController();
  TextEditingController _bgColorController = TextEditingController();
  TextEditingController _textColorController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "All Statuses List",
          style: TextStyle(fontWeight: FontWeight.w900, color: kPrimaryColor),
        ),

      ),
      body: GetBuilder<StatusController>(builder: (statusController) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: statusController.status.result?.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Container(
                  height: 200.0,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kPrimaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SL : ${statusController.status.result?.data?[index].id.toString()}",
                        style: kTextStyle,
                      ),
                      Text(
                        "Status Name  : ${statusController.status.result?.data?[index].name.toString()}",
                        style: kTextStyle,
                      ),
                      Text(
                        "Background Color : ${statusController.status.result?.data?[index].bgColor.toString()}",
                        style: kTextStyle,
                      ),
                      Text(
                        "Text Color : ${statusController.status.result?.data?[index].textColor.toString()}",
                        style: kTextStyle,
                      ),
                      const Text(
                        "Status : null",
                        style: kTextStyle,
                      ),
                      // Center(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       showModalBottomSheet(
                      //         context: context,
                      //         builder: (context) => bottomSheet(
                      //           bottomSheetTitle: "Edit Order Statuses",
                      //           buttonText: "Submit",
                      //           filed1: _nameController,
                      //           filed2: _bgColorController,
                      //           filed3: _textColorController,
                      //           hint1: "Order Name",
                      //           hint2: "Background Color",
                      //           hint3: "Text Color",
                      //           onPressed: () async {
                      //             await statusController.feupdateStatus(
                      //               statusController.status.result?.data?[index].id ?? 1,
                      //               {
                      //                 "name": _nameController.text,
                      //                 "bg_color": _bgColorController.text,
                      //                 "text_color": _textColorController.text,
                      //               },
                      //             );
                      //             _nameController.clear();
                      //             _bgColorController.clear();
                      //             _textColorController.clear();
                      //             Navigator.pop(context);
                      //             // Refresh data after updating
                      //             setState(() {
                      //               statusController.fetchStatus();
                      //             });
                      //           },
                      //         ),
                      //       );
                      //     },
                      //     child: Text("Edit"),
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
