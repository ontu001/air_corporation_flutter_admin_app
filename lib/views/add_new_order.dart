import 'package:air_corporation/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../widget/custom_text_fied_for_addorder_editorder.dart';

class AddNewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderController =
        Get.find<OrderController>(); // Access the controller

    TextEditingController _1Controller = TextEditingController();
    TextEditingController _2Controller = TextEditingController();
    TextEditingController _3Controller = TextEditingController();
    TextEditingController _4Controller = TextEditingController();
    TextEditingController _5Controller = TextEditingController();
    TextEditingController _6Controller = TextEditingController();
    TextEditingController _7Controller = TextEditingController();
    TextEditingController _8Controller = TextEditingController();
    TextEditingController _9Controller = TextEditingController();
    TextEditingController _10Controller = TextEditingController();
    TextEditingController _11Controller = TextEditingController();
    TextEditingController _12Controller = TextEditingController();
    TextEditingController _13Controller = TextEditingController();
    TextEditingController _14Controller = TextEditingController();
    TextEditingController _15Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          "Add New Order",
          style: TextStyle(fontWeight: FontWeight.w900, color: kPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text("Order Information"),

            CustomTextFiledforAddAndEditOrder(
              controller: _1Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _2Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _3Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _4Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _5Controller,
            ),

            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(
              hintText: "contact name",

            ),
            SizedBox(
              height: 10,
            ),
            Text("Product Information"),
            CustomTextFiledforAddAndEditOrder(
              controller: _6Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _7Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _8Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _9Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _10Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _11Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _12Controller,
            ),
            ElevatedButton(onPressed: () {}, child: Text("ADD")),
            SizedBox(
              height: 10,
            ),
            Text("Regular Price : 0bdt"),
            SizedBox(
              height: 10,
            ),
            Text("Discount : 0bdt"),
              SizedBox(
              height: 10,
            ),
            Text("Offer Price : 0bdt"),
            CustomTextFiledforAddAndEditOrder(
              controller: _13Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _14Controller,
            ),
            CustomTextFiledforAddAndEditOrder(
              controller: _15Controller,
            ),
            Text("Payable Price: 0bdt"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () async {
                    //print("object");
                    bool result = await orderController.orderCreate();
                    if (result == true) {
                      Get.snackbar("Order Added", "Order Added Successfully");
                    } else {
                      Get.snackbar("Failed", "Something went worng!",
                          colorText: Colors.red);
                    }
                  },
                  child: Text(
                    "ADD ORDER",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
