import 'package:flutter/material.dart';
import 'package:sign_in_project/core/constant/color.dart';

class CustomTextFeild extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final TextEditingController? controller;
  final String iconsName;
  final String textType;
  final void Function(String)? onChanged;
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.iconsName,
    required this.textType,
    required this.onChanged,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: AppColors.primaryElementText,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: errorText != null ? Colors.red : AppColors.primaryText,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.03,
                margin: EdgeInsets.only(left: 17),
                child: Image.asset(iconsName),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    // keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: hintText,
                      hintStyle: TextStyle(
                        color: AppColors.primarySecondaryElementText,
                        fontWeight: FontWeight.normal,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                    autocorrect: false,
                    obscureText: textType == "password",
                    obscuringCharacter: "*",
                  ),
                ),
              ),
            ],
          ),
        ),
        if (errorText != null) ...[
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }
}
