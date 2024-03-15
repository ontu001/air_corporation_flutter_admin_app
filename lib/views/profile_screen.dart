import 'package:air_corporation/common/variables.dart';
import 'package:air_corporation/services/auth_services.dart';
import 'package:air_corporation/widget/custom_appbar.dart';
import 'package:air_corporation/widget/custom_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/app_color.dart';
import '../widget/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final GetStorage userData = GetStorage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Profile Screen'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: kPrimaryColor,
                child: Icon(
                  Icons.person_outline_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomCard(
                  firstText: Text(
                    'Name :  ${userData.read("name")}',
                  ),
                  title: ''),
              CustomCard(
                  firstText: Text(
                    'User Email : ${userData.read("userEmail")}',
                  ),
                  title: ''),
              CustomCard(
                  firstText: Text(
                    'Contact Number : ${userData.read("phone_number")}',
                  ),
                  title: ''),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.width * 0.07,
                      child: CustomButton(
                        onTap: () {
                          // Get.to(ChangePasswordScreen());
                          Get.toNamed('/changePasswordScreen');
                        },
                        title: "Change Password",
                        fontColor: Colors.white,
                        fontSize: 16,
                        btnColor: kPrimaryColor,
                      ),
                    ),
                    Container(
                      height: size.width * 0.07,
                      child: CustomButton(
                        onTap: () async {
                          await AuthServices().logOut();
                        },
                        title: "Log Out",
                        fontSize: 16,
                        btnColor: kPrimaryColor,
                        fontColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
