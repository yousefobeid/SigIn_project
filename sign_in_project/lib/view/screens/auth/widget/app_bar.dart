import 'package:flutter/material.dart';
import 'package:sign_in_project/core/constant/color.dart';

AppBar buildAppBar(String titleName) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(color: AppColors.primaryFourElementText, height: 1),
    ),
    title: Text(
      titleName,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}
