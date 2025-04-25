import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/remote/sign_in_remote.dart';
import 'package:sign_in_project/service/service.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/bloc/sign_in_event.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRemoteData signInRemoteData;
  final BuildContext context;
  SignInBloc(this.signInRemoteData, this.context)
    : super(
        SignInState(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          emailFocus: FocusNode(),
          passwordFocus: FocusNode(),
          obscureText: true,
          isValid: false,
          isLoading: false,
          emailError: '',
        ),
      ) {
    on<EmailEvent>(handleEmailEvent);
    on<PasswordEvent>(handlePasswordEvent);
    on<ValidateEmailAndPassword>(_handleValidateEmailAndPassword);
    on<ResetValidationEvent>((event, emit) {
      emit(state.copyWith(isValid: false));
    });
    on<SignInSubmitted>(_signInSubmitted);
  }
  Future<void> _signInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      //Prepare login data (without userId)
      SignInModel userInput = SignInModel(
        userId: '',
        username: '',
        password: state.password,
        rePassword: '',
        email: state.email,
      );

      // Call Firebase login method
      var response = await signInRemoteData.login(
        data: userInput,
        // from: "signIn",
        // context: context,
      );

      //Check for result
      if (response != null && response.exists) {
        Map<String, dynamic> data = response.data() as Map<String, dynamic>;
        SignInModel userModel = SignInModel.fromMap(data);
        userModel.userId = response.id;
        print(userModel.userId);
        //Save to SharedPreferences
        if (context.mounted) {
          String userJson = jsonEncode(userModel.toJson());

          // تخزين البيانات في SharedPreferences
          await MyServices().sharedPreferences.setString(
            "localDateKey",
            userJson,
          );

          emit(
            SignInSuccess(
              emailController: state.emailController,
              passwordController: state.passwordController,
              emailFocus: state.emailFocus,
              passwordFocus: state.passwordFocus,
              emailError: state.emailError,
            ),
          );
        }
      }
    } catch (e) {
      print("SignIn error: $e");
      // showSnackBar("Lo");

      emit(state.copyWith(isLoading: false));
    }
  }

  void handleEmailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void handlePasswordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _handleValidateEmailAndPassword(
    ValidateEmailAndPassword event,
    Emitter<SignInState> emit,
  ) {
    final email = state.email;
    final password = state.password;
    String emailError = '';
    String passwordError = '';

    if (email.isEmpty) {
      emailError = 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emailError = 'Invalid email format';
    }

    if (password.isEmpty) {
      passwordError = 'Password cannot be empty';
    } else if (password.length < 6) {
      passwordError = 'Password must be at least 6 characters long';
    }

    // Update the state with errors and isValid flag
    emit(
      state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        isValid: emailError.isEmpty && passwordError.isEmpty,
      ),
    );

    if (emailError.isEmpty && passwordError.isEmpty) {
      // Proceed with the sign-in process
      print('Sign-in successful with email: $email and password: $password');
    } else {
      // Handle validation errors
      print('Validation errors: $emailError, $passwordError');
    }
  }
}
