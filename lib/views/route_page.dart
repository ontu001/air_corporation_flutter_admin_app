

import 'package:air_corporation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/custom_bottom_tabbar.dart';
import '../widget/custom_dialog.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class RoutePage extends StatelessWidget {
  RoutePage({super.key});
  var _selectedIndex = 0.obs;

  List<Widget> page = [
    const HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return (await customDialog(
          title: "Confirmation",
          content: "Do you want to close this App?",
          confirmOnTap: () => Navigator.of(context).pop(true),
          cancelOnTap: () => Navigator.of(context).pop(false),
        ));
        },
        child: Obx(
          () => Scaffold(
            body: page[_selectedIndex.value],
            bottomNavigationBar: CustomBottomTabBar(
              index: _selectedIndex.value,
              onChangedTab: onChangedTab,
            ),
          ),
        ));
  }

  void onChangedTab(int index) {
    this._selectedIndex(index);
  }
}
