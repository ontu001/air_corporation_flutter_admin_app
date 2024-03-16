import 'dart:async';

import 'package:get/get.dart';
import '../services/api_service.dart';

class OrderController extends GetxController {

  var isLoading = false.obs;
  var orderList = [].obs;

  Future<void> order(var endUrl) async {
    var token = "65|nXalcR53N9X6inPEG0OSsk1MA9IOnwpnsKTiTgyq1f50c3e5";

    try {
      isLoading.value = true;
      orderList.value = await ApiServices.get(
        endUrl,
        {
          "Content-Type": "application/json",
          "Accept": "application/json",
          'Authorization': 'Bearer $token',
          // Add other headers if needed (e.g., Content-Type)
        },
      );
      //
       print(">>>>>>> ${orderList[1]}");


      // if (res.data != null) {
      //   if (res.statusCode == 200) {
      //     isLoading.value = false;
      //
      //  //   print("order ok: >>>>>>> ${res.data}");
      //     orderList = OrdersModel.fromJson(res.data);
      //    // print("order statusCode: >>>>>>> ${res.statusCode}");
      //
      //      print("deliveryFee: >>>>>>> ${orderList.result}");
      //
      //     //  return "true";
      //   } else {
      //     isLoading.value = false;
      //     // return "false";
      //   }
      // }
    } catch (e) {
      isLoading.value = false;
      print(e);
      // return "error: false";
    }
  }
}
