import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_project/core/constant/color.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/remote/register_remote.dart';
import 'package:sign_in_project/view/screens/auth/register/bloc/register.bloc.dart';
import 'package:sign_in_project/view/screens/auth/register/bloc/register.state.dart';
import 'package:sign_in_project/view/screens/auth/register/bloc/register_event.dart';
import 'package:sign_in_project/view/screens/auth/widget/Custom_text.dart';
import 'package:sign_in_project/view/screens/auth/widget/Custom_text_feild.dart';
import 'package:sign_in_project/view/screens/auth/widget/app_bar.dart';
import 'package:sign_in_project/view/screens/auth/widget/custom_button.dart';

// ignore: must_be_immutable
class Register extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameComtroller = TextEditingController();
  TextEditingController rePasswordCotroller = TextEditingController();
  final SignInModel userModel;

  Register({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listenWhen:
          (previous, current) =>
              previous.hasValidationPassed != current.hasValidationPassed,
      listener: (context, state) async {
        if (state.hasValidationPassed) {
          final newUser = SignInModel(
            userId: '',
            username: userNameComtroller.text,
            password: passwordController.text,
            rePassword: rePasswordCotroller.text,
            email: emailController.text,
          );
          final result = await RegisterRemote().signUp(data: newUser);
          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
          print("Upload Result: $result");

          if (result == 'Success') {
            emailController.clear();
            userNameComtroller.clear();
            passwordController.clear();
            rePasswordCotroller.clear();
          }
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder:
            (context, state) => Scaffold(
              appBar: buildAppBar("Register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    const Center(
                      child: CustomText(
                        text: "Enter your details below & free sign up",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: "User Name"),
                          SizedBox(height: 15.h),
                          CustomTextFeild(
                            hintText: "Enter Your User Name",
                            iconsName: "assets/icons/user.png",
                            textType: "name",
                            onChanged: (val) {
                              context.read<RegisterBloc>().add(
                                UserNameEvent(val),
                              );
                            },
                            controller: userNameComtroller,
                            errorText:
                                state.userNameError.isNotEmpty
                                    ? state.userNameError
                                    : null,
                          ),
                          const CustomText(text: "Email"),
                          SizedBox(height: 15.h),
                          CustomTextFeild(
                            hintText: "Enter Your Email Address",
                            iconsName: "assets/icons/user.png",
                            textType: "Email",
                            onChanged: (val) {
                              context.read<RegisterBloc>().add(EmailEvent(val));
                            },
                            controller: emailController,
                            errorText:
                                state.emailError.isNotEmpty
                                    ? state.emailError
                                    : null,
                          ),
                          const CustomText(text: "Password"),
                          SizedBox(height: 15.h),
                          CustomTextFeild(
                            hintText: "Enter Your Password",
                            iconsName: "assets/icons/lock.png",
                            textType: "password",
                            onChanged: (val) {
                              context.read<RegisterBloc>().add(
                                PasswordEvent(val),
                              );
                            },
                            controller: passwordController,
                            errorText:
                                state.passwordError.isNotEmpty
                                    ? state.passwordError
                                    : null,
                          ),
                          const CustomText(text: "Confirm Password"),
                          SizedBox(height: 15.h),
                          CustomTextFeild(
                            hintText: "Enter Your Confirm Password",
                            iconsName: "assets/icons/lock.png",
                            textType: "password",
                            onChanged: (val) {
                              context.read<RegisterBloc>().add(
                                RePasswordEvent(val),
                              );
                            },
                            controller: rePasswordCotroller,
                            errorText:
                                state.rePasswordError.isNotEmpty
                                    ? state.rePasswordError
                                    : null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const CustomText(
                      text:
                          "By Creating an Account you agree with our Terms & Conditions",
                    ),
                    SizedBox(height: 15.h),
                    state.isLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryElement,
                          ),
                        )
                        : CustomButtonSignInAndRegister(
                          buttonType: "signIn",
                          buttonName: "Register",
                          onPressed: () {
                            // Step 1: Collect data from the controllers
                            final userName = userNameComtroller.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            final rePassword = rePasswordCotroller.text;
                            // Step 2: Create the SignInModel instance
                            final newUser = SignInModel(
                              username: userName,
                              email: email,
                              password: password,
                              rePassword: rePassword,
                              userId: '',
                            );
                            context.read<RegisterBloc>().add(
                              ValidateRegister(),
                            );
                          },
                        ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
