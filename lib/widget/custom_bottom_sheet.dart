import 'package:air_corporation/common/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class bottomSheet extends StatelessWidget {
  final String bottomSheetTitle;
  final String buttonText;
  final String? hint1;
  final String? hint2;
  final String? hint3;
  final TextEditingController? filed1;
  final TextEditingController? filed2;
  final TextEditingController? filed3;
  final VoidCallback? onPressed;

  const bottomSheet({this.bottomSheetTitle = "",  this.buttonText = "",  this.hint1 = " ",  this.hint2= "",  this.hint3= "",  this.filed1,  this.filed2,  this.filed3, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 1000,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bottomSheetTitle,
            style: TextStyle(color: kPrimaryColor),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: hint1),
            controller: filed1,
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: hint2),
            controller: filed2,
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: hint3),
            controller: filed3,
          ),

          SizedBox(
            height: 25.0,
          ),
          SizedBox(
            width: 200.0,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: onPressed,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}