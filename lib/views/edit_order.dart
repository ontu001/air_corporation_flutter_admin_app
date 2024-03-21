import 'package:air_corporation/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../widget/custom_text_fied_for_addorder_editorder.dart';

class EditOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final orderController =
        Get.find<OrderController>(); // Access the controller
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
          "Edit Order",
          style: TextStyle(fontWeight: FontWeight.w900, color: kPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text("Order Information"),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(
              hintText: "contact name",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Product Information"),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("ADD")),
            SizedBox(
              height: 40,
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
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            CustomTextFiledforAddAndEditOrder(),
            SizedBox(
              height: 10,
            ),
            Text("Payable Price: 0bdt"),
            SizedBox(
              height: 10,
            ),
         Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () async {
                    //print("object");
                    bool result = await orderController.orderUpdate(2);
                    if (result == true) {
                      Get.snackbar("Order Updated", "Order Updated Successfully");
                    } else {
                      Get.snackbar("Failed", "Something went worng!",
                          colorText: Colors.red);
                    }
                  },
                  child: Text(
                    "Edit ORDER",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
