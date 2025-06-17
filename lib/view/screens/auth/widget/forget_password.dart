import 'package:flutter/material.dart';
import 'package:sign_in_project/core/constant/color.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),

      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forget Password?",
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: "Avenir",
            fontWeight: FontWeight.normal,
            fontSize: 15,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
