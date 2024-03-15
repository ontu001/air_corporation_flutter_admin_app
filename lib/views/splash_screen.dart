// import 'dart:async';

// import 'package:air_corporation/controller/auth_controller.dart';
// import 'package:air_corporation/services/auth_services.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';

// import '../common/variables.dart';

// class SplashScreen extends GetView<AuthController> {
//   SplashScreen({super.key});
//   final GetStorage userData = GetStorage();

//   @override
//   Widget build(BuildContext context) {
//     // Get.put(AuthController());
//     Size size = MediaQuery.of(context).size;

// Timer(const Duration(milliseconds: 1800), () async {
//   await AuthServices().isUserLogin();
// });

//     return Scaffold(
//       body: Container(
//         height: size.height,
//         width: size.width,
//         color: Color.fromARGB(255, 225, 230, 232),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: size.width * 0.60,
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 // color: kPrimaryColor,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';

import 'package:air_corporation/services/auth_services.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..forward();
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1800), () async {
      await AuthServices().isUserLogin();
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 173, 177, 233)],
          ),
        ),
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset(
            'assets/images/logo.png',
            width: 300,
          ),
        ),
      ),
    );
  }
}
