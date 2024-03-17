import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/constant.dart';

class BoyListFOrOrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8,left: 8,right: 8,top: 10),
        child: ListView.builder(
          itemCount: 10,

          itemBuilder: (context, index){

            return Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(bottom: 10.0),
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.grey,),


              child: Column(
                children: [

                  //info
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //group 1
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text("Order id : ",style: kTextStyle,),
                            Text("Status : ",style: kTextStyle,),
                            Text("Phone : ",style: kTextStyle,),
                            Text("Date : ",style: kTextStyle,),


                          ],
                        ),


                        SizedBox(width: 160,),

                        //group 2
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text("Currier : ",style: kTextStyle,),
                            Text("Paid Status : ",style: kTextStyle,),
                            Text("Updated by : ",style: kTextStyle,),
                            Text("Payable Amount : ",style: kTextStyle,),


                          ],
                        ),

                      ],
                    ),
                  ),




                  //actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.print)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delivery_dining)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: Colors.red,)),
                    ],
                  ),



                  //action
                  Row(
                    children: [

                    ],
                  )
                ],
              ),
            );

          },
        ),
      ),
    );
  }

}