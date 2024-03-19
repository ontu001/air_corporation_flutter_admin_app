import 'package:flutter/material.dart';

import '../common/app_color.dart';
import '../widget/custom_text_fied_for_addorder_editorder.dart';

class AddNewOrder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: kPrimaryColor,),),

          title: Text("Add New Order",style: TextStyle(fontWeight: FontWeight.w900,color: kPrimaryColor),),
          centerTitle: true,
        ),


      body: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text("Order Information"),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),


            SizedBox(height: 10,),
            Text("Product Information"),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            ElevatedButton(onPressed: (){}, child: Text("ADD")),


            SizedBox(height: 10,),
            Text("Regular Price : 0bdt"),
            Text("Discount : 0bdt"),
            Text("Offer Price : 0bdt"),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            CustomTextFiledforAddAndEditOrder(),
            Text("Payable Price: 0bdt"),
            ElevatedButton(onPressed: (){}, child: Text("ADD ORDER")),


          ],
        ),
      ),
    );
  }

}