import 'package:get/get.dart';


import '../services/auth_services.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    isLogIn();
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    isLogIn();
    super.onReady();
  }

  Future<void> isLogIn() async {
    await AuthServices().isUserLogin();
    // print(
    //     "------------ ${loginUserCID} ==== ${loginUserId} ===== ${loginUserPass}");
  }

  @override
  void onClose() {
    // called just before the Controller is deleted from memory
    isLogIn();
    super.onClose();
  }
}
