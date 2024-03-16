import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/orders_controller.dart';

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
      body: GetBuilder<OrderController>(
        builder: (context) {
          return Center(
            child:

            Obx(() {
              return  Column(
                children: [
                  Text(
                  context.orderList[0]['customer_name'],
                  ),
                  Text(
                    context.orderList[0]['district'],
                  ),
                  Text(
                    context.orderList[0]['order_note'],
                  ),

                ],
              );
            })
           ,
          );
        }
      ),
    );
  }
}
