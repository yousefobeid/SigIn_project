import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_project/core/constant/color.dart';

class BordingWelcome extends StatelessWidget {
  final String buttonName;
  void Function()? onPressed;
  final int index;
  final String imagePath;
  final String title;
  final String description;
  BordingWelcome({
    super.key,
    required this.index,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 40.h),
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.29,
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          MaterialButton(
            elevation: 5,
            height: MediaQuery.of(context).size.height * 0.07,
            minWidth: double.infinity,
            onPressed: onPressed,
            // onPressed: () {
            //   if (index < 2) {
            //     pageController.animateToPage(
            //       index + 1,
            //       duration: const Duration(milliseconds: 500),
            //       curve: Curves.easeIn,
            //     );
            //   } else {}
            // },
            color: AppColors.primaryElement,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              buttonName,
              style: const TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
