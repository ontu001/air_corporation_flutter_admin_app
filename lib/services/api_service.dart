import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

//String dbaseUrl = "https://arcorporationapi.ewant.com.bd/api";
String dbaseUrl = "http://api.arcorporation.xyz/api";

GetStorage userData = GetStorage();
var token = userData.read("token");

class ApiServices {
  static Future<dynamic> get(
    String endUrl,
    Map<String, String>? headers,
  ) async {
    final response = await http.get(
      Uri.parse(dbaseUrl + endUrl),
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
    String endUrl,
    Map body,
    Map<String, String>? headers,
  ) async {
    final response = await http.put(Uri.parse(dbaseUrl + endUrl),
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

  static Future<dynamic> create(
    String endUrl,
    Map body,
    Map<String, String>? headers,
  ) async {
    final response = await http.post(Uri.parse(dbaseUrl + endUrl),
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

  static Future<dynamic> delete(
    String endUrl,
    Map<String, String>? headers,
  ) async {
    final response = await http.delete(Uri.parse(dbaseUrl + endUrl),
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
