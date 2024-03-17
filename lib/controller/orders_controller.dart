import 'dart:async';
import 'dart:convert';

import 'package:air_corporation/model/orders_model.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class OrderController extends GetxController {
  OrdersModel orderList = OrdersModel();

  var isLoading = false.obs;

  Future<void> fetchOrders() async {
    // var token = data['api_token'];

    var token = "65|nXalcR53N9X6inPEG0OSsk1MA9IOnwpnsKTiTgyq1f50c3e5";

    try {
      isLoading.value = true;
      final res = await ApiServices.get(
        "/admin/orders",
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

          orderList = OrdersModel.fromJson(jsonData);

         print("message: >>>>>>> ${orderList.result?.data?[0].customerName}");
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
