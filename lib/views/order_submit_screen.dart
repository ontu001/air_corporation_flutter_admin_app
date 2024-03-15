import 'dart:io';

import 'package:air_corporation/common/app_color.dart';
import 'package:air_corporation/views/custom_dropdown_button.dart';
import 'package:air_corporation/widget/custom_appbar.dart';
import 'package:air_corporation/widget/custom_text_field.dart';
import 'package:air_corporation/widget/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

class OrderSubmitScreen extends StatefulWidget {
  const OrderSubmitScreen({super.key});

  @override
  State<OrderSubmitScreen> createState() => _OrderSubmitScreenState();
}

class _OrderSubmitScreenState extends State<OrderSubmitScreen> {
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  final _image = ''.obs;
  final tagList = [
    "AB0909",
    "BY8789",
    "CU8779",
    "NG8719",
  ].obs;
  final tag = Rxn<String>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: Text('Order Submit'),
        ),
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
              child: Column(
                children: [
                  CustomTextField(
                    controller: _description,
                    radius: 5,
                    padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
                    hintText: "Product Description...",
                    minLines: 3,
                    maxLines: 6,
                    textInputAction: TextInputAction.newline,
                    inputType: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextField(
                    controller: _price,
                    radius: 5,
                    padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
                    hintText: "Product Price",
                    textInputAction: TextInputAction.newline,
                    inputType: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => CustomDropDownButton(
                      hintText: "Select Tag",
                      itemsList: tagList,
                      value: tag.value,
                      onChanged: (value) {
                        tag("$value");
                      },
                      buttonBorder: Border.all(
                        width: 0.8,
                        color: kPrimaryColor,
                      ),
                      dropDownColor: Colors.blue.shade100,
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 10, 20.0, 10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_number,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Order Submit',
                          style: myTextStyle(clr: Colors.white, size: 18.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
