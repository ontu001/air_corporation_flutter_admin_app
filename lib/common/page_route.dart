import 'package:air_corporation/views/hold_on_screen.dart';
import 'package:air_corporation/views/home_screen.dart';
import 'package:air_corporation/views/order_submit_screen.dart';
import 'package:air_corporation/views/route_page.dart';
import 'package:get/get.dart';

import '../main.dart';

import '../views/add_new_order.dart';
import '../views/change_password_screen.dart';


import '../views/login_screen.dart';

import '../views/order_list.dart';
import '../views/order_report.dart';
import '../views/all_statuses_list.dart';
import '../views/profile_screen.dart';

var getPages = [
  GetPage(name: "/", page: () => MyApp()),
  GetPage(name: "/route", page: () => RoutePage()),
  GetPage(name: "/login", page: () => LogInScreen()),
  GetPage(name: "/homeScreen", page: () => HomeScreen()),
  GetPage(name: "/profileScreen", page: () => ProfileScreen()),
  GetPage(name: "/changePasswordScreen", page: () => ChangePasswordScreen()),
  GetPage(name: "/OrderSubmitScreen", page: () => AddNewOrder()),
  GetPage(name: "/OrderList", page: () => OrderList()),
  GetPage(name: "/OrderStatus", page: () => OrderStatus()),
  GetPage(name: "/OrderReport", page: () => OrderReport()),
  GetPage(name: "/holdOnScreen", page: () => HoldOnScreen()),


];
