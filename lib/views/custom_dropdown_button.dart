import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';


class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    Key? key,
    required this.itemsList,
    this.value,
    this.buttonWidth,
    this.onChanged,
    this.hintText,
    this.buttonColor,
    this.dropdownWidth,
    this.searchController,
    this.onMenuStateChange,
    this.searchInnerWidget,
    this.searchMatchFn,
    this.buttonBorder,
    this.iconEnabledColor,
    this.customButton,
    this.hintColor,
    this.dropDownColor,
    this.dropDownItemColor,
    this.offset,
    this.dropdownMaxHeight,
    this.textOverflow,
    this.searchInnerWidgetHeight,
    this.dropdownDirection,
    this.isExpanded,
  }) : super(key: key);

  final double? buttonWidth;
  final List<String> itemsList;
  final String? value;
  final double? dropdownWidth;
  final void Function(String?)? onChanged;
  final String? hintText;
  final BoxBorder? buttonBorder;
  final Color? buttonColor;
  final Color? iconEnabledColor;
  final TextEditingController? searchController;
  final Widget? searchInnerWidget;
  final bool Function(DropdownMenuItem<dynamic>, String)? searchMatchFn;
  final void Function(bool)? onMenuStateChange;
  final Widget? customButton;
  final Color? hintColor;
  final Color? dropDownColor;
  final Color? dropDownItemColor;
  final Offset? offset;
  final double? dropdownMaxHeight;
  final TextOverflow? textOverflow;
  final double? searchInnerWidgetHeight;
  final DropdownDirection? dropdownDirection;
  final bool? isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Obx(
        () => DropdownButton2(
          isExpanded: isExpanded ?? true,
          // scrollbarAlwaysShow: true,
          scrollbarRadius: const Radius.circular(50),
          scrollbarThickness: 3,
          dropdownDirection: dropdownDirection ?? DropdownDirection.right,
          hint: Text(
            '$hintText',
            style: TextStyle(
              fontSize: 14,
              color: hintColor ?? Colors.black38,
            ),
          ),
          items: itemsList.map((item) {
            // bool isSelected = item.toString() == value;
            bool isLastItem = item == itemsList.last;
            return DropdownMenuItem<String>(
              value: item.toString(),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: isLastItem
                      ? null
                      : Border(
                          bottom: BorderSide(
                            width: 0.1,
                            color: Colors.grey,
                          ),
                        ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  item.toString().replaceAll(RegExp("[_]"), " "),
                  style: TextStyle(
                    fontSize: 14,
                    color: dropDownItemColor,
                  ),
                  overflow: textOverflow ?? TextOverflow.ellipsis,
                ),
              ),
            );
          }).toList(),
          buttonDecoration: BoxDecoration(
            border: buttonBorder ?? null,
            color: buttonColor ?? Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          // dropdownDirection: DropdownDirection.right,
          customButton: customButton,
          buttonPadding: EdgeInsets.symmetric(horizontal: 5.0),
          iconEnabledColor: iconEnabledColor ?? Colors.grey,

          value: value,
          onChanged: onChanged,
          isDense: false,
          buttonHeight: 42,
          // style: TextStyle(overflow: TextOverflow.clip, color: Colors.black),
          buttonWidth: buttonWidth ?? double.infinity,
          itemHeight: 40,
          dropdownWidth: dropdownWidth,
          dropdownMaxHeight: dropdownMaxHeight ?? 220,
          searchController: searchController,
          searchInnerWidget: searchInnerWidget,
          searchMatchFn: searchMatchFn,
          searchInnerWidgetHeight: searchInnerWidgetHeight,
          //This to clear the search value when you close the menu
          onMenuStateChange: onMenuStateChange,
          dropdownDecoration: BoxDecoration(
            color: dropDownColor ?? kSecondaryColor,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 4.0,
                spreadRadius: 2,
              ),
            ],
          ),
          offset: offset ?? Offset(0, -4),
        ),
      ),
    );
  }
}
