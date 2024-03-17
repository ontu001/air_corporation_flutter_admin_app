import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

String dbaseUrl = "https://arcorporationapi.ewant.com.bd/api";

var token = "65|nXalcR53N9X6inPEG0OSsk1MA9IOnwpnsKTiTgyq1f50c3e5";

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
            'Authorization': 'Bearer $token',
          },
    );

    if (response.statusCode == 200) {
      // final responseBody = jsonDecode(response.body);
      return response;

      // final result = responseBody['result']['data'] as List;
      // return result;
    } else {
      print(response.body);
    }

    return null;
  }
}
