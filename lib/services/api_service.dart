import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

String dbaseUrl = "https://arcorporationapi.ewant.com.bd/api";

GetStorage userData = GetStorage();
var token = userData.read("token");

class ApiServices {
  static Future<dynamic> get(
    String url,
    Map<String, String>? headers,
  ) async {
    final response = await http.get(
      Uri.parse(dbaseUrl + url),
      headers: headers ??
          {
            "Content-Type": "application/json",
            "Accept": "application/json",
            // 'Authorization': 'Bearer $token',
          },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.body);
    }
    return null;
  }

  static Future<dynamic> update(
    String url,
    Map body,
    Map<String, String>? headers,
  ) async {
  
    final response = await http.put(
      Uri.parse(dbaseUrl + url),
        body: jsonEncode(body),
        headers: headers ??
            {
              "Content-Type": "application/json",
              "Accept": "application/json",
            });
    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.body);
    }
    return null;
  }
}
