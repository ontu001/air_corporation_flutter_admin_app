import 'dart:async';
import 'dart:convert';

import 'package:air_corporation/model/order_update_model.dart';
import 'package:air_corporation/model/orders_model.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class OrderController extends GetxController {
  OrdersModel orderList = OrdersModel();
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

  var orderUpdatebody = {
    "customer_name": "Test costomer",
    "phone_number": "01686381077",
    "address_details": "Address details",
    "district": "Dhaka",
    "order_note": "Any order note",
    "paid_status": "unpaid", // paid
    "order_from": "message", // daraz
    "special_discount": 10,
    "advance_payment": 40,
    "delivery_charge": 100,
    "status_id": 2,
    "items": [
      {
        "product_name": "Product 1",
        "product_color": "Red",
        "product_size": "L",
        "quantity": 1,
        "buy_price": 100,
        "mrp": 200,
        "sell_price": 150
      },
      {
        "product_name": "Product 1",
        "product_color": "Green",
        "product_size": "XL",
        "quantity": 2,
        "buy_price": 600,
        "mrp": 700,
        "sell_price": 700
      },
      {
        "product_name": "Product 1",
        "product_color": "Blue",
        "product_size": "M",
        "quantity": 3,
        "buy_price": 1400,
        "mrp": 1800,
        "sell_price": 1700
      }
    ]
  };

  Future<bool> orderUpdate(int id) async {
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

  var orderCreteBody = {
    "customer_name": "Test costomer",
    "phone_number": "01686381900",
    "address_details": "Address details",
    "district": "Dhaka",
    "order_note": "Any order note",
    "paid_status": "unpaid", // paid
    "order_from": "message", // daraz
    "special_discount": 10,
    "advance_payment": 50,
    "delivery_charge": 50,
    "items": [
      {
        "product_name": "Product 1",
        "product_color": "Red",
        "product_size": "L",
        "quantity": 1,
        "buy_price": 100,
        "mrp": 200,
        "sell_price": 150
      },
      {
        "product_name": "Product 1",
        "product_color": "Green",
        "product_size": "XL",
        "quantity": 2,
        "buy_price": 600,
        "mrp": 700,
        "sell_price": 700
      },
      {
        "product_name": "Product 1",
        "product_color": "Blue",
        "product_size": "M",
        "quantity": 3,
        "buy_price": 1400,
        "mrp": 1800,
        "sell_price": 1700
      }
    ]
  };

  Future<bool> orderCreate() async {
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

          Map<String, dynamic> jsonData = jsonDecode(res.body);

          //Need update model:
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
}
