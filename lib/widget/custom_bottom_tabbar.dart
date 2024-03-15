
import 'package:flutter/material.dart';

import '../common/app_color.dart';

class CustomBottomTabBar extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  const CustomBottomTabBar({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _CustomBottomTabBarState createState() => _CustomBottomTabBarState();
}

class _CustomBottomTabBarState extends State<CustomBottomTabBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      shape: CircularNotchedRectangle(),
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(
            index: 0,
            icon: Icon(Icons.home),
          ),
          // buildTabItem(
          //   index: 1,
          //   icon: Icon(Icons.shopping_cart_outlined),
          // ),
          // buildTabItem(
          //   index: 2,
          //   icon: Icon(Icons.favorite_border),
          // ),
          buildTabItem(
            index: 1,
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Widget icon,
  }) {
    final isSelected = index == widget.index;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : kPrimaryColor,
      ),
      child: IconButton(
        onPressed: () {
          widget.onChangedTab(index);
        },
        padding: EdgeInsets.all(8.0),
        constraints: BoxConstraints(maxHeight: 46.0, minHeight: 46),
        icon: icon,
        color: isSelected ? kPrimaryColor : Colors.white,
      ),
    );
  }
}
