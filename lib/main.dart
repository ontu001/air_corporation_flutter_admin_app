import 'package:air_corporation/common/app_color.dart';
import 'package:air_corporation/common/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'common/variables.dart';
import 'views/splash_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// get app verisonxc
  appVersion.value = '';
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appVersion.value = packageInfo.version.toString();

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 400),
        initialRoute: "/",
        getPages: getPages,
        title: 'Air Corporation',
        theme: ThemeData(
    
          primaryColor: kPrimaryColor,
        ),
    
        home: SplashScreen(),
      ),
    );
  }
}
