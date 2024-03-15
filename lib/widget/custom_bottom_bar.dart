import 'package:flutter/material.dart';


import '../common/app_color.dart';





class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    super.key,
      this.leftOnTap, this.rightOnTap,
  });
 
  final VoidCallback? leftOnTap;
  final VoidCallback? rightOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            // spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0.8, 0.8), // changes position of shadow
          ),
        ],
        // borderRadius: BorderRadius.vertical(top: Radius.circular(5.0))
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap:leftOnTap,
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(width: 2, color: Colors.white),
          Expanded(
            child: InkWell(
              onTap: rightOnTap,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
