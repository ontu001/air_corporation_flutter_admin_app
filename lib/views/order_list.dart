import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/orders_controller.dart';
import '../widget/body_list_for_order_screen.dart';
import '../widget/custom_bottom_bar_for_order_screen.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  OrderController orderController = Get.put(OrderController());
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Column(

          children: [
            CustomBottomForOrderScreen(),
            BoyListFOrOrderScreen(),


          ],
        ),
      ),


    );
  }
}

