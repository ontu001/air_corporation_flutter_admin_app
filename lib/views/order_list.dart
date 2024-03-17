import 'package:air_corporation/common/app_color.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: kPrimaryColor,),),
        title: Text("Orders",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w900),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},icon: Icon(Icons.add,color: kPrimaryColor,),),
        ],
      ),
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
