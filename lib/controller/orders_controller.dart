import 'dart:async';
import 'dart:convert';

import 'package:air_corporation/model/order_update_model.dart';
import 'package:air_corporation/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';

class OrderController extends GetxController {
  Rx<OrdersModel?> orderList = Rx<OrdersModel?>(null);

  OrderUpdateModel orderUpdatecheck = OrderUpdateModel();

  var isLoading = false.obs;
  var token = userData.read("token");

  Future<void> fetchOrders() async {
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

          orderList.value = OrdersModel.fromJson(jsonData);

          print(
              "message: >>>>>>> ${orderList.value?.result?.data?[0].customerName}");
        } else {
          isLoading.value = false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  Future<bool> orderUpdate(int id, var orderUpdatebody) async {
    try {
      isLoading.value = true;
      final res = await ApiServices.update(
        "/admin/orders/$id",
        orderUpdatebody,
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

          print("aita e orderUpdatecheck >>>>>>> ${res.body}");

          Map<String, dynamic> jsonData = jsonDecode(res.body);

          orderUpdatecheck = OrderUpdateModel.fromJson(jsonData);

          // print("status: >>>>>>> ${status.result?.data?[0].bgColor}");
          // print("status 2: >>>>>>> ${status.result?.data?[0].textColor}");
          return true;
        } else {
          isLoading.value = false;
          return false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      return false;
    }
    return false;
  }

  Future<bool> orderCreate(var orderCreteBody) async {
    try {
      isLoading.value = true;
      final res = await ApiServices.create(
        "/admin/orders",
        orderCreteBody,
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

          print("aita e orderCretecheck >>>>>>> ${res.body}");

          Map<String, dynamic> jsonData = jsonDecode(res.body);

          //ai khane model crete kore call dite hove;
          //response na aser karone akhon aibabe diye rakhse;
          orderUpdatecheck = OrderUpdateModel.fromJson(jsonData);

          // print("status: >>>>>>> ${status.result?.data?[0].bgColor}");
          // print("status 2: >>>>>>> ${status.result?.data?[0].textColor}");
          return true;
        } else {
          isLoading.value = false;
          return false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      return false;
    }
    return false;
  }

  Future<bool> orderDelete(int id) async {
    try {
      isLoading.value = true;
      final res = await ApiServices.delete(
        "/admin/orders/$id",
        {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );

      print("aita e delete : >>>>>>> ${res.body}");
      // print(">>>>>>> ${token}");

      if (res.body != null) {
        if (res.statusCode == 200) {
          isLoading.value = false;

          print("aita e delete er ta >>>>>>> ${res.body}");

          // Map<String, dynamic> jsonData = jsonDecode(res.body);

          //Need update model:
          //orderUpdatecheck = OrderUpdateModel.fromJson(jsonData);

          // print("status: >>>>>>> ${status.result?.data?[0].bgColor}");
          // print("status 2: >>>>>>> ${status.result?.data?[0].textColor}");
          return true;
        } else {
          isLoading.value = false;
          return false;
        }
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
      return false;
    }
    return false;
  }
}
