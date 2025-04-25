import 'package:flutter/material.dart';
import 'package:sign_in_project/core/constant/color.dart';

class CustomButtonSignInAndRegister extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonName;
  final String buttonType;
  const CustomButtonSignInAndRegister({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
        right: 25,
        top: buttonType == "signIn" ? 0 : 20,
      ),
      child: MaterialButton(
        elevation: 5,
        height: MediaQuery.of(context).size.height * 0.07,
        minWidth: MediaQuery.of(context).size.width * 0.95,
        onPressed: onPressed,
        color:
            buttonType == "signIn"
                ? AppColors.primaryElement
                : AppColors.primaryElementText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          buttonName,
          style: TextStyle(
            color:
                buttonType == "signIn"
                    ? AppColors.primaryBackground
                    : AppColors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
