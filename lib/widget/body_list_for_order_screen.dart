import 'package:air_corporation/controller/orders_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../common/constant.dart';
import '../views/edit_order.dart';

class BoyListFOrOrderScreen extends StatefulWidget {
  @override
  State<BoyListFOrOrderScreen> createState() => _BoyListFOrOrderScreenState();
}

class _BoyListFOrOrderScreenState extends State<BoyListFOrOrderScreen> {
  OrderController orderController = OrderController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (controller) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 10),
          child: ListView.builder(
            itemCount: controller.orderList.result?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(bottom: 10.0),
                height: 300,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kPrimaryColor,
                ),
                child: Column(
                  children: [
                    //info
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // //group 1
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Order id : ${controller.orderList.result?.data![index].id.toString()}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Status : ${controller.orderList.result?.data![index].status?.name.toString()}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Phone : ${controller.orderList.result?.data![index].phoneNumber.toString()}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Date : ${controller.orderList.result?.data![index].createdAt.toString().substring(0, controller.orderList.result?.data![index].createdAt.toString().indexOf('T'))}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Currier : ${controller.orderList.result?.data![index].courierName.toString() == "null" ? " " : controller.orderList.result?.data![index].courierName.toString()}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Paid Status : ${controller.orderList.result?.data![index].paidStatus.toString()}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Updated by : ${controller.orderList.result?.data![index].updatedBy?.name.toString()}",
                                style: kTextStyle,
                              ),
                              Text(
                                "Payable Amount : ${controller.orderList.result?.data![index].payablePrice.toString()}",
                                style: kTextStyle,
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          //group 2
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Text(
                          //       "Currier : ${controller.orderList.result?.data![index].courierName.toString() == "null" ? " " : controller.orderList.result?.data![index].courierName.toString()}",
                          //       style: kTextStyle,
                          //     ),
                          //     Text(
                          //       "Paid Status : ${controller.orderList.result?.data![index].paidStatus.toString()}",
                          //       style: kTextStyle,
                          //     ),
                          //     Text(
                          //       "Updated by : ${controller.orderList.result?.data![index].updatedBy?.name.toString()}",
                          //       style: kTextStyle,
                          //     ),
                          //     Text(
                          //       "Payable Amount : ${controller.orderList.result?.data![index].payablePrice.toString()}",
                          //       style: kTextStyle,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),

                    //actions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        IconButton(
                            onPressed: () async{
                            await  Get.to(EditOrder( id:  orderController.orderList.result?.data?[index].id ?? 0));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.print)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delivery_dining)),
                        IconButton(
                            onPressed: () {


                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Warning'),
                                  content:
                                      Text('Are you sure you want to delete?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        // Handle confirm action

                                        var result =
                                            await controller.orderDelete(controller.orderList.result?.data?[index].id ?? 0);
                                        if (result == true) {
                                          Get.snackbar("Deleted",
                                              "Item deleted successfully");
                                          setState(() {
                                            controller.fetchOrders();
                                          });

                                        } else {
                                          Get.snackbar(
                                              "Please increse order list",
                                              "Please increse order list");
                                        }
                                        Navigator.pop(
                                          context,
                                        );
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
                            )),
                      ],
                    ),

                    //action
                    Row(
                      children: [],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
