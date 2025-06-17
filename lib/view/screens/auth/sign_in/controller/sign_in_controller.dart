import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/remote/sign_in_remote.dart';
import 'package:sign_in_project/service/service.dart';

class SignInController {
  final BuildContext context;
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  SignInRemoteData signInRemoteData = SignInRemoteData();

  SignInController({required this.context, required this.passwordController});

  signIn() async {
    try {
      SignInModel userDate = SignInModel(
        userId: '',
        username: '',
        password: passwordController.text,
        rePassword: '',
        email: emailController.text,
        // logedInDate: Timestamp.fromDate(DateTime.now()),
      );
      // var response = signInRemoteData.login(data: userDate, from: "signIn");
      // if (response != null) {
      //   SignInModel user = SignInModel.fromMap(response.data());
      //   user.isLogedIn = true;
      //   user.userId = response.id;
      //   user.logedInDate = userDate.logedInDate;
      //   String userJson = jsonEncode(user.toJson());
      //   await MyServices().sharedPreferences.setString(
      //     "localDateKey",
      //     userJson,
      //   );
      //   Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      // }
    } catch (e) {
      _showSnackBar("SignIn error: $e");
    }
  }

  getLocalDateKey() async {
    String? localDateKey = MyServices().sharedPreferences.getString(
      "localDateKey",
    );
    if (localDateKey != null) {
      Map<String, dynamic> clientMap = jsonDecode(localDateKey);

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  void _showSnackBar(String message) {
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  handleSignIn() {}
  // Future<void> handleSignIn() async {
  //   final bloc = context.read<SignInBloc>();
  //   final state = bloc.state;

  //   // Show loading
  //   bloc.emit(state.copyWith(isLoading: true));

  //   try {
  //     final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: state.email,
  //       password: state.password,
  //     );
  //     print("$response");
  //     final user = response.user;
  //     print("$user");

  //     if (user == null) {
  //       print("1111111111111111111111111111");

  //       bloc.emit(state.copyWith(isLoading: false));
  //       _showSnackBar("User not found.");
  //       return;
  //     }

  //     if (!user.emailVerified) {
  //       bloc.emit(state.copyWith(isLoading: false));
  //       _showSnackBar("Please verify your email before logging in.");
  //       return;
  //     }

  //     // Save email in local storage (e.g., SharedPreferences)

  //     // await MyServices().saveEmail(state.email);
  //     print("222222222222222222222222222222222222");

  //     // Success
  //     bloc.emit(state.copyWith(isLoading: false));
  //     _showSnackBar("Login successful");

  //     // Navigate to home
  //     print("4444444444444444444444444444444444444444");

  //     Navigator.of(context).pushReplacementNamed("/home");
  //     print("777777777777777777777777777777777777");
  //   } on FirebaseAuthException catch (e) {
  //     bloc.emit(state.copyWith(isLoading: false));

  //     String errorMessage;

  //     switch (e.code) {
  //       case 'user-not-found':
  //         errorMessage = 'No user found with this email.';
  //         break;
  //       case 'wrong-password':
  //         errorMessage = 'Incorrect password.';
  //         break;
  //       case 'invalid-email':
  //         errorMessage = 'Invalid email format.';
  //         break;
  //       case 'user-disabled':
  //         errorMessage = 'This user account has been disabled.';
  //         break;
  //       default:
  //         errorMessage = 'Something went wrong. Try again.';
  //     }

  //     _showSnackBar(errorMessage);
  //   } catch (e) {
  //     bloc.emit(state.copyWith(isLoading: false));
  //     _showSnackBar("An unexpected error occurred.");
  //     print("Error during sign-in: $e");
  //   }
  // }

  // void _showSnackBar(String message) {
  //   if (context.mounted) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text(message)));
  //   }
  // }
}
