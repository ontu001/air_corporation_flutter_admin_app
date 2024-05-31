// ignore_for_file: must_be_immutable

import 'package:air_corporation/services/auth_services.dart';
import 'package:air_corporation/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../common/variables.dart';
import '../widget/custom_button.dart';
import '../widget/custom_dialog.dart';
import '../widget/custom_progress_indicator.dart';
import '../widget/custom_snackbar.dart';

import '../widget/custom_text_field.dart';
import '../widget/my_text_style.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _isObscure = true.obs;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return (await customDialog(
          title: "Confirmation",
          content: "Do you want to close this App?",
          confirmOnTap: () => Navigator.of(context).pop(true),
          cancelOnTap: () => Navigator.of(context).pop(false),
        ));
      },
      child: Scaffold(
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
                            Container(
                              height: size.width * 0.60,
                              child: Image.asset(
                                'assets/ar.png',
                                // color: kPrimaryColor,
                              ),
                            ),
                            CustomTextField(
                              controller: _userEmailController,
                              lebelText: "User Email",
                              hintText: "Enter User Email",
                              validatorText: "Enter User Email",
                              prefixIcon: Icon(Icons.person),
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Obx(
                              () => CustomTextField(
                                controller: _passwordController,
                                lebelText: "Password",
                                hintText: "Enter Password",
                                validatorText: "Enter Password",
                                obscureText: _isObscure.value,
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _isObscure(!_isObscure.value);
                                  },
                                  child: Icon(
                                    _isObscure.value == false
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            CustomButton(
                              onTap: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (_formKey.currentState!.validate()) {
                                  await NetworkService
                                          .checkInternetConnectivity()
                                      .then((internet) {
                                    if (internet == true) {
                                      AuthServices().login(
                                        userEmail: _userEmailController.text,
                                        userPass: _passwordController.text,
                                      );
                                    } else {
                                      customSnackBar(
                                          bgClr: snackBarErrorClr,
                                          msg: "Check Internet Connection");
                                    }
                                  });
                                }
                              },
                              title: "LOGIN",
                              fontColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "version: ${appVersion.value}",
                        style: myTextStyle(
                          clr: Colors.black45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Container(
                height: double.infinity,
                width: double.infinity,
                child: AuthServices.isLoading == true
                    ? Container(
                        color: Colors.black.withOpacity(0.5),
                        child: CustomProgressIndicator(),
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
