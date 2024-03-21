import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFiledforAddAndEditOrder extends StatelessWidget{
  final String filedName;
  final String hintText;
  final TextEditingController? controller;

  const CustomTextFiledforAddAndEditOrder({this.filedName = "",  this.controller,  this.hintText= ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(filedName),
        SizedBox(height: 5,),
        Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: TextField(
            autofocus: false,
            decoration: InputDecoration(hintText: hintText,border: InputBorder.none),
            controller: controller,
          ),
        )
      ],
    );
  }


}