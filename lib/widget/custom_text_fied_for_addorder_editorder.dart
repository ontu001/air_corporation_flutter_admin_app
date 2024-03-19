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
        TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: hintText),
          controller: controller,
        )
      ],
    );
  }


}