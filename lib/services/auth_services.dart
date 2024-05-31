import 'dart:convert';

import 'package:air_corporation/common/variables.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/app_color.dart';
import '../common/const.dart';

import '../model/login_model.dart';
import '../widget/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class AuthServices extends GetConnect {
  static var isLoading = false.obs;
  GetStorage userData = GetStorage();

  Future login({String? userEmail, String? userPass}) async {
    try {
      isLoading(true);
      String url = 'http://api.arcorporation.xyz/api/admin/login';

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"email": userEmail, "password": userPass}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var data = jsonResponse['result']['user'];
        var token = jsonResponse['result']['token'];

        userData.write('name', data['name']);
        userData.write('phone_number', data['phone_number']);
        userData.write('email', data['email']);
        userData.write('userData', data);
        userData.write('token', token);
        userData.write('userEmail', userEmail ?? '');
        isUserLogin();

        Get.offAllNamed("/route");
        customSnackBar(
            bgClr: snackBarSuccessClr, msg: '${jsonResponse['message']}');
      } else {
        customSnackBar(bgClr: snackBarErrorClr, msg: 'Somethings wants wrong');
      }
    } finally {
      isLoading(false);
    }
  }

  Future isUserLogin() async {
    loginUserEmail = userData.read("userEmail") ?? '';
    loginUserPass = userData.read("userPass") ?? '';
    if (loginUserEmail!.isNotEmpty && loginUserPass!.isNotEmpty) {
      Get.offNamed('/route');
    } else {
      Get.offNamed('/login');
    }
  }

  Future<void> logOut() async {
    await userData.erase();
    Get.offAllNamed("/login");
  }

  Future<void> changePassword({String? oldPass, String? newPass}) async {
    try {
      isLoading(true);
      String _url =
          "${base_url}api_change_pass/api_change_pass?&user_id=$loginUserEmail&user_pass=$oldPass&new_pass=$newPass";

      print('Change password url: ${_url}');
      var body = {};
      final response = await post(_url, body);
      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['success']) {
        Get.offAllNamed('/login');
        await userData.erase();
        customSnackBar(
            bgClr: snackBarSuccessClr, msg: "${response.body['ret_str']}");
      } else {
        customSnackBar(
            bgClr: snackBarErrorClr, msg: "${response.body['ret_str']}");
      }
    } finally {
      isLoading(false);
    }
  }
}
