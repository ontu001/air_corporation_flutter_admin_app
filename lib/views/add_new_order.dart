import 'package:flutter/material.dart';

import '../common/app_color.dart';
import '../widget/custom_text_fied_for_addorder_editorder.dart';

class AddNewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(onPressed: () {}, child: Text("ADD ORDER")),
          ],
        ),
      ),
    );
  }
}
