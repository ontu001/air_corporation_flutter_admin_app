import 'package:air_corporation/common/app_color.dart';
import 'package:air_corporation/common/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Status_controller.dart';
import '../widget/custom_bottom_sheet.dart';

class OrderStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusController statController = Get.put(StatusController());
    TextEditingController _nameController = TextEditingController();
    TextEditingController _bgColorController = TextEditingController();
    TextEditingController _textColorController = TextEditingController();



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
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // print("updateStatus");

                            showModalBottomSheet(
                                context: context,
                                builder: (context) => bottomSheet(
                                      bottomSheetTitle: "Edit Order Statues",
                                      buttonText: "Submit",
                                      filed1: _nameController,
                                      filed2: _bgColorController,
                                      filed3: _textColorController,
                                      hint1: "Order Name",
                                      hint2: "Background Color",
                                      hint3: "Text Color",
                                      onPressed: () async {
                                        await statusController.feupdateStatus(
                                            statusController.status.result
                                                    ?.data?[index].id ??
                                                1,
                                            {
                                              "name": _nameController.text,
                                              "bg_color":
                                                  _bgColorController.text,
                                              "text_color":
                                                  _textColorController.text,
                                            });
                                      },
                                    ));
                          },
                          child: Text("Edit"),
                        ),
                      ),
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
