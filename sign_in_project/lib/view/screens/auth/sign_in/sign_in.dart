import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/core/constant/color.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/bloc/sign_in_event.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/bloc/sign_in_state.dart';
import 'package:sign_in_project/view/screens/auth/widget/Custom_text.dart';
import 'package:sign_in_project/view/screens/auth/widget/Custom_text_feild.dart';
import 'package:sign_in_project/view/screens/auth/widget/app_bar.dart';
import 'package:sign_in_project/view/screens/auth/widget/custom_button.dart';
import 'package:sign_in_project/view/screens/auth/widget/forget_password.dart';
import 'package:sign_in_project/view/screens/auth/widget/icons_sign_in.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen:
          (previous, current) =>
              previous.isValid != current.isValid && current.isValid,
      listener: (context, state) async {
        if (state is SignInSuccess) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil("/home", (route) => false);
        } else if (state is SignInError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        context.read<SignInBloc>().add(SignInSubmitted());
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder:
            (context, state) => Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconsSignIn(),
                    SizedBox(height: 20),
                    Center(
                      child: CustomText(
                        text: "Or Use Your Email Account LogIn",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Email"),
                          SizedBox(height: 15),
                          CustomTextFeild(
                            hintText: "Enter Your Email",
                            iconsName: "assets/icons/user.png",
                            textType: "email",
                            onChanged: (val) {
                              context.read<SignInBloc>().add(EmailEvent(val));
                            },
                            controller: emailController,
                            errorText:
                                state.emailError.isNotEmpty
                                    ? state.emailError
                                    : null,
                          ),
                          SizedBox(height: 5),
                          CustomText(text: "Password"),
                          SizedBox(height: 5),
                          CustomTextFeild(
                            hintText: "Enter Your Password",
                            iconsName: "assets/icons/lock.png",
                            textType: "password",
                            onChanged: (val) {
                              context.read<SignInBloc>().add(
                                PasswordEvent(val),
                              );
                            },
                            controller: passwordController,

                            errorText:
                                state.passwordError.isNotEmpty
                                    ? state.passwordError
                                    : null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    ForgetPassword(),
                    SizedBox(height: 50),
                    state.isLoading
                        ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryElement,
                          ),
                        )
                        : CustomButtonSignInAndRegister(
                          buttonType: "signIn",
                          buttonName: "Sign In",
                          onPressed: () {
                            context.read<SignInBloc>().add(
                              ValidateEmailAndPassword(),
                            );
                          },
                        ),
                    SizedBox(height: 20),
                    CustomButtonSignInAndRegister(
                      buttonName: "Register",
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      buttonType: 'register',
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
