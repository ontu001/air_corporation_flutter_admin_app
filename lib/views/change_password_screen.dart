// ignore_for_file: must_be_immutable


import 'package:air_corporation/services/auth_services.dart';
import 'package:air_corporation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../services/network_service.dart';
import '../widget/custom_button.dart';

import '../widget/custom_progress_indicator.dart';
import '../widget/custom_text_field.dart';
import '../widget/my_text_style.dart';

class ChangePasswordScreen extends StatelessWidget {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmedPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _isCurrentObscure = true.obs;
  var _isNewObscure = true.obs;
  var _isConfirmedObscure = true.obs;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Flexible(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Change Password',
                            style: myTextStyle(
                                size: 25,
                                clr: kPrimaryColor,
                                fw: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Obx(
                            () => CustomTextField(
                              controller: _oldPasswordController,
                              lebelText: "Current Password",
                              hintText: "Enter Corrent Password",
                              validatorText: "Enter Corrent  Password",
                              obscureText: _isCurrentObscure.value,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _isCurrentObscure(!_isCurrentObscure.value);
                                },
                                child: Icon(
                                  _isCurrentObscure.value == false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Obx(
                            () => CustomTextField(
                              controller: _newPasswordController,
                              lebelText: " new Password",
                              hintText: "Enter New Password",
                              validatorText: "Enter New Password",
                              obscureText: _isNewObscure.value,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _isNewObscure(!_isNewObscure.value);
                                },
                                child: Icon(
                                  _isNewObscure.value == false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Obx(
                            () => CustomTextField(
                              controller: _confirmedPasswordController,
                              lebelText: " Confirmed Password",
                              hintText: "Enter Confirmed Password",
                              validatorText: "Enter Confirmed Password",
                              obscureText: _isConfirmedObscure.value,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _isConfirmedObscure(
                                      !_isConfirmedObscure.value);
                                },
                                child: Icon(
                                  _isConfirmedObscure.value == false
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          CustomButton(
                            onTap: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (_formKey.currentState!.validate()) {
                                await NetworkService.checkInternetConnectivity()
                                    .then((internet) async {
                                  if (internet == true) {
                                    if (_newPasswordController.text ==
                                        _confirmedPasswordController.text) {
                                      await AuthServices().changePassword(
                                        oldPass:
                                            _oldPasswordController.text.trim(),
                                        newPass:
                                            _newPasswordController.text.trim(),
                                      );
                                    } else {
                                      customSnackBar(
                                          bgClr: snackBarErrorClr,
                                          msg: "New Password not match");
                                    }
                                  } else {
                                    customSnackBar(
                                        bgClr: snackBarErrorClr,
                                        msg: "Check Internet Connection");
                                  }
                                });
                              }
                              // Get.offAllNamed('/login');
                            },
                            title: "Change Password",
                            fontColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => AuthServices.isLoading.value == true
                ? Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.black.withOpacity(0.4),
                    alignment: Alignment.center,
                    child: CustomProgressIndicator(),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
