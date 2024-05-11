import 'package:air_corporation/common/app_color.dart';
import 'package:air_corporation/common/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Status_controller.dart';
import '../controller/orders_controller.dart';
import '../widget/body_list_for_order_screen.dart';
import '../widget/custom_bottom_bar_for_order_screen.dart';
import 'add_new_order.dart';


class OrderList extends StatefulWidget {
  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  OrderController orderController = Get.put(OrderController());
  StatusController statusController = Get.put(StatusController());
  @override
  void initState() {
    super.initState();
    statusController.fetchStatus();
    orderController.fetchOrders();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          orderController.fetchOrders();
          statusController.fetchStatus();
        });
      },child: Icon(Icons.refresh),),
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: kPrimaryColor,),),
        title: const Text("Orders",style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w900),),
        centerTitle: true,
        actions: [
          ElevatedButton(onPressed: (){}, child: Text('All',style: kTextStyle,),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrimaryColor)),),
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
