import 'dart:async';
import 'dart:convert';

import 'package:air_corporation/model/status_model.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class StatusController extends GetxController {
  StatusModel status = StatusModel();

  var isLoading = false.obs;

  Future<void> fetchStatus() async {
    // var token = data['api_token'];

    var token = "65|nXalcR53N9X6inPEG0OSsk1MA9IOnwpnsKTiTgyq1f50c3e5";
    try {
      isLoading.value = true;
      final res = await ApiServices.get(
        "/admin/statuses",
        {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      print("aita e >>>>>>> ${res.body}");
      print(">>>>>>> ${token}");

      if (res.body != null) {
        if (res.statusCode == 200) {
          isLoading.value = false;

          print("aita e 2222 >>>>>>> ${res.body}");

         
          Map<String, dynamic> jsonData = jsonDecode(res.body);

          status = StatusModel.fromJson(jsonData);

         print("status: >>>>>>> ${status.result?.data?[0].bgColor}");
         print("status 2: >>>>>>> ${status.result?.data?[0].textColor}");
        } else {
          isLoading.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }


  



}
