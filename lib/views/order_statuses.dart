import 'package:air_corporation/common/app_color.dart';
import 'package:air_corporation/common/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Status_controller.dart';

class OrderStatus extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: kPrimaryColor,),),
        centerTitle: true,
        title: Text("All Statuses List",style: TextStyle(fontWeight: FontWeight.w900,color: kPrimaryColor),),
      ),




      body: GetBuilder<StatusController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.status.result?.data?.length ?? 0,
                itemBuilder: (context, index){
                  return Container(
                    height: 200.0,
                    width: double.maxFinite,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(bottom: 10.0),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kPrimaryColor,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SL : ${controller.status.result?.data?[index].id.toString()}", style: kTextStyle,),
                        Text("Status Name  : ${controller.status.result?.data?[index].name.toString()}", style: kTextStyle,),
                        Text("Background Color : ${controller.status.result?.data?[index].bgColor.toString()}", style: kTextStyle,),
                        Text("Text Color : ${controller.status.result?.data?[index].textColor.toString()}", style: kTextStyle,),
                        Text("Status : null", style: kTextStyle,),

                        Center(child: ElevatedButton(onPressed: (){
                          print(controller.status.result?.data?.length);
                        },child: Text("Edit"),),),
                      ],
                    ),


                  );
                },
              ),
            ),
          );
        }
      ),

    );
  }

}