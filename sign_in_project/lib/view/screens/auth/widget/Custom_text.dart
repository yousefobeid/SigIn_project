import 'package:flutter/material.dart';
import 'package:sign_in_project/core/constant/color.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primarySecondaryElementText,
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }
}
