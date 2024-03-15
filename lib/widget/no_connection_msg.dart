// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_button.dart';
import 'my_text_style.dart';

class NoConnectionMsg extends StatelessWidget {
  NoConnectionMsg({
    super.key,
    required this.onTap,
  });
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/no_connection.svg",
              width: size.width * 0.60,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Connection Faild",
                    style: myTextStyle(
                      size: 22.0,
                      clr: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Check your connection, then refresh the  page",
                      style: myTextStyle(
                        size: 16.0,
                        clr: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    onTap: () {},
                    title: 'Refresh',
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 08.0),

                    // onTap: onTap,
                    // width: 100.0,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: 20.0, vertical: 08.0),
                    // radius: BorderRadius.circular(50.0),
                    // child: Text(
                    //   "Refresh",
                    //   style: myTextStyle(
                    //     clr: Colors.white,
                    //     fw: FontWeight.w600,
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
