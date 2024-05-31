import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_color.dart';
import '../common/variables.dart';
import '../controller/Status_controller.dart';
import '../controller/orders_controller.dart';
import '../services/auth_services.dart';

import '../views/all_statuses_list.dart';
import '../views/order_list.dart';
import '../views/order_report.dart';
import 'my_text_style.dart';

class CustomDrawer extends StatefulWidget {


  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  OrderController orderController = Get.put( OrderController());
  StatusController statusController = Get.put(StatusController());


  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              // height: 150,
              width: double.infinity,
              padding: EdgeInsets.only(top: 40, left: 1, right: 1, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                // image: DecorationImage(image: AssetImage('$appLogo')),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/ar.png',
                height: size.width * 0.18,
                fit: BoxFit.cover,
              ),

            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  menulist(
                    onTap: () => Get.offAllNamed("/route"),
                    title: "Home",
                    icon: Icons.home_outlined,
                  ),
                  menulist(
                    onTap: () async{
                      setState(() {
                        orderController.fetchOrders();
                      });
                     await Get.to(OrderList());


                    },



                    title: "Orders",
                    icon: Icons.shop,
                  ),


                  menulist(
                  //  onTap: () async => await Get.to(OrderStatus()),

                    onTap:() async{
                      setState(() {
                        statusController.fetchStatus();

                      });
                      await Get.to(OrderStatus());
                    },
                    title: "OrderStatus",
                    icon: Icons.info,
                  ),

                  menulist(
                    onTap: () async=> await Get.to(OrderReport()),
                    title: "OrderReport",
                    icon: Icons.report,
                  ),

                  menulist(
                    onTap: () => AuthServices().logOut(),
                    title: "Log Out",
                    icon: Icons.logout,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                  // color: searchBtnColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80.0))),
              child: Text(
                "version: ${appVersion.value}",
                style: myTextStyle(
                  size: 14.0,
                  clr: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  menulist({
    String? title,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(16.0, 10.0, 10.0, 10.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              Icon(icon, color: kPrimaryColor),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "${title ?? ''}",
                style: myTextStyle(clr: Colors.black54, size: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
