import 'package:air_corporation/controller/orders_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../common/constant.dart';
import '../views/edit_order.dart';




class BoyListForOrderScreen extends StatefulWidget {
  final String selectedStatus;

  BoyListForOrderScreen({required this.selectedStatus});

  @override
  State<BoyListForOrderScreen> createState() => _BoyListForOrderScreenState();
}

class _BoyListForOrderScreenState extends State<BoyListForOrderScreen> {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 10),
          child: Obx(() {
            final allOrders = controller.orderList.value?.result?.data ?? [];
            final filteredOrders = widget.selectedStatus.isEmpty
                ? allOrders
                : allOrders.where((order) => order.status?.name == widget.selectedStatus).toList();

            return ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                return Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(bottom: 10.0),
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(EditOrder(
                                id: order.id ?? 0,
                                index: index,
                                phoneNumber: order.phoneNumber.toString() ?? "kk ",
                                customerName: order.customerName.toString() ?? "no name",
                                distc: order.district.toString() ?? "no name",
                                cAddress: order.addressDetails.toString() ?? "no name",
                                orderStatus: order.paidStatus.toString() ?? "no name",
                                orderForm: order.orderFrom.toString() ?? "no name",
                                orderNote: order.orderNote.toString() ?? "no name",
                                contactName: order.customerName.toString() ?? "no name",
                                buyPrice: order.buyPrice.toString() ?? "no name",
                                mrpPrice: order.mrp.toString() ?? "no name",
                                sellPrice: order.sellPrice.toString() ?? "no name",
                              ));
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Warning'),
                                  content: Text('Are you sure you want to delete?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        var result = await controller.orderDelete(order.id ?? 0);
                                        if (result == true) {
                                          Get.snackbar("Deleted", "Item deleted successfully");
                                          controller.fetchOrders();
                                        } else {
                                          Get.snackbar("Error", "Unable to delete order");
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order id : ${order.id.toString()}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Status : ${order.status?.name.toString()}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Phone : ${order.phoneNumber.toString()}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Date : ${order.createdAt.toString().substring(0, order.createdAt.toString().indexOf('T'))}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Courier : ${order.courierName.toString() == "null" ? " " : order.courierName.toString()}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Paid Status : ${order.paidStatus.toString()}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Updated by : ${order.updatedBy?.name.toString()}",
                                  style: kTextStyle,
                                ),
                                Text(
                                  "Payable Amount : ${order.payablePrice.toString()}",
                                  style: kTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      );
    });
  }
}