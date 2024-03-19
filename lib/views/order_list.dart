import 'package:air_corporation/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/orders_controller.dart';
import '../widget/body_list_for_order_screen.dart';
import '../widget/custom_bottom_bar_for_order_screen.dart';
import 'add_new_order.dart';


class OrderList extends StatelessWidget {
  OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: kPrimaryColor,),),
        title: const Text("Orders",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w900),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNewOrder())),icon: const Icon(Icons.add,color: kPrimaryColor,),),
        ],
      ),
      body: Column(
        children: [
          CustomBottomForOrderScreen(),
          BoyListFOrOrderScreen(),
        ],
      ),
    );
  }
}
