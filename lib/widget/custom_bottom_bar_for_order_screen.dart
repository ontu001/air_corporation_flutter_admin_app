import 'package:flutter/cupertino.dart';

import 'custom_button.dart';

class CustomBottomForOrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 70.0,
      width: double.maxFinite,


      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),

        scrollDirection: Axis.horizontal,
        children: [


          CustomButton(onTap: (){}, title: 'Back',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'Add +',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'all',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'on way',),
          SizedBox(width: 7,),

          CustomButton(onTap: (){}, title: 'submit',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'hold on',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'Under Verified',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'canceled',),
          SizedBox(width: 7,),

          CustomButton(onTap: (){}, title: 'Under processing',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'deliverd',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'conplited',),
          SizedBox(width: 7,),
          CustomButton(onTap: (){}, title: 'returened',),


        ],
      ),
    );
  }

}