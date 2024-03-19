import 'dart:async';
import 'dart:convert';

import 'package:air_corporation/model/status_model.dart';
import 'package:air_corporation/model/status_update_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';

class StatusController extends GetxController {
  StatusModel status = StatusModel();
  StatusUpdateModel statusUpdate = StatusUpdateModel();

  var isLoading = false.obs;
  var token = userData.read("token");

 


  Future<void> feupdateStatus( int id,var body) async {
    try {
      isLoading.value = true;
      final res = await ApiServices.update(
        "/admin/statuses/$id",
        body,
        {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",

        },
      );

      // print("aita e >>>>>>> ${res.body}");
      // print(">>>>>>> ${token}");

      if (res.body != null) {
        if (res.statusCode == 200) {
          isLoading.value = false;

          print("aita e 2222 >>>>>>> ${res.body}");

          Map<String, dynamic> jsonData = jsonDecode(res.body);

          statusUpdate = StatusUpdateModel.fromJson(jsonData);

          // print("status: >>>>>>> ${status.result?.data?[0].bgColor}");
          // print("status 2: >>>>>>> ${status.result?.data?[0].textColor}");
        } else {
          isLoading.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }



  Future<void> fetchStatus() async {
    try {
      isLoading.value = true;
      final res = await ApiServices.get(
        "/admin/statuses",
        {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",

        },
      );

      // print("aita e >>>>>>> ${res.body}");
      // print(">>>>>>> ${token}");

      if (res.body != null) {
        if (res.statusCode == 200) {
          isLoading.value = false;

         // print("aita e 2222 >>>>>>> ${res.body}");

          Map<String, dynamic> jsonData = jsonDecode(res.body);

          status = StatusModel.fromJson(jsonData);

          // print("status: >>>>>>> ${status.result?.data?[0].bgColor}");
          // print("status 2: >>>>>>> ${status.result?.data?[0].textColor}");
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
