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
      body: GetBuilder<OrderController>(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.orderList.result!.data![0].customerName.toString(),
              ),
              Text(
                context.orderList.result!.data![0].paidStatus.toString(),
              ),
              Text(
                context.orderList.result!.data![1].customerName.toString(),
              ),
              Text(
                context.orderList.result!.data![1].paidStatus.toString(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
