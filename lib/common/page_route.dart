import 'package:air_corporation/views/home_screen.dart';
import 'package:air_corporation/views/order_submit_screen.dart';
import 'package:air_corporation/views/route_page.dart';
import 'package:air_corporation/views/status_screen.dart';
import 'package:get/get.dart';

import '../main.dart';

import '../views/change_password_screen.dart';

import '../views/expense_details_screen.dart';

import '../views/login_screen.dart';

import '../views/order_list.dart';
import '../views/profile_screen.dart';

var getPages = [
  GetPage(name: "/", page: () => MyApp()),
  GetPage(name: "/route", page: () => RoutePage()),
  GetPage(name: "/login", page: () => LogInScreen()),
  GetPage(name: "/homeScreen", page: () => HomeScreen()),
  GetPage(name: "/profileScreen", page: () => ProfileScreen()),
  GetPage(name: "/changePasswordScreen", page: () => ChangePasswordScreen()),
  GetPage(name: "/OrderSubmitScreen", page: () => OrderSubmitScreen()),
  GetPage(name: "/OrderList", page: () => OrderList()),
  GetPage(name: "/StatusScreen", page: () => StatusScreen()),

];
