import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/app_color.dart';
import '../common/constant.dart';

class OrderReport extends StatefulWidget{

  @override
  State<OrderReport> createState() => _OrderReportState();
}

class _OrderReportState extends State<OrderReport> {
  // Variables to store selected dates
  DateTime? _startDate;

  DateTime? _endDate;

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2015, 1, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2015, 1, 1),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _endDate) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back,color: kPrimaryColor,),),

        title: Text("Orders Reports",style: TextStyle(fontWeight: FontWeight.w900,color: kPrimaryColor),),
        actions: [
          TextButton(onPressed: (){}, child: Text("Excel",style: TextStyle(color: kPrimaryColor),)),
          TextButton(onPressed: (){}, child: Text("Filter",style: TextStyle(color: kPrimaryColor),)),


        ],
      ),




      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [
                   
                   TextButton(
                     onPressed: () => _selectStartDate(context),
                     child: Text('Start Date',style: TextStyle(color: kPrimaryColor),),
                   ),
                   Container(
                       height: 40,
                       width: 200,
                       decoration: BoxDecoration(
                           border: Border.all(),
                         borderRadius: BorderRadius.circular(10.0)
                       ),
                       child: Center(child: Text('${_startDate != null ? _formatDate(_startDate!) : ''}',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w700,fontSize: 16.5),))),

                 ],
               ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  TextButton(
                    onPressed: () => _selectEndDate(context),
                    child: Text('End Date',style: TextStyle(color: kPrimaryColor),),
                  ),
                  Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, ),
                          borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('${_endDate != null ? _formatDate(_endDate!) : ''}',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w700,fontSize: 16.5),))),

                ],)
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index){
                  return Container(
                    height: 400.0,
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
                        Text("SL : ", style: kTextStyle,),
                        Text("Order Id : ", style: kTextStyle,),
                        Text("Phone : ", style: kTextStyle,),
                        Text("Date : ", style: kTextStyle,),
                        Text("Customer Name : ", style: kTextStyle,),
                        Text("Buy Price : ", style: kTextStyle,),
                        Text("Mrp Price : ", style: kTextStyle,),
                        Text("Discount : ", style: kTextStyle,),
                        Text("Sell price : ", style: kTextStyle,),
                        Text("Delivery Charge : ", style: kTextStyle,),
                        Text("Special Discount : ", style: kTextStyle,),
                        Text("Total : ", style: kTextStyle,),
                        Text("Profit : ", style: kTextStyle,),



                      ],
                    ),


                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}