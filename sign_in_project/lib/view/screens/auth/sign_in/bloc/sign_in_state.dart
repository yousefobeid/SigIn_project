import 'package:flutter/material.dart';

class SignInState {
  final String email;
  final String password;
  final String emailError;
  final String passwordError;
  final bool isValid;
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final bool obscureText;
  final String? errorMessage;

  SignInState({
    required this.emailError,
    this.passwordError = '',
    required this.emailController,
    required this.passwordController,
    required this.emailFocus,
    required this.passwordFocus,
    this.obscureText = false,
    this.errorMessage,
    this.email = '',
    this.password = '',
    this.isValid = false,
    this.isLoading = false,
  });

  // Updated copyWith method to allow updating the isValid property
  SignInState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? isValid, //  isValid parameter for state update
    bool? isLoading,
    bool? obscureText,
    String? errorMessage,
  }) {
    return SignInState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      emailController: emailController,
      passwordController: passwordController,
      emailFocus: emailFocus,
      passwordFocus: passwordFocus,
      obscureText: obscureText ?? this.obscureText,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid, // Ensure isValid can be updated
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SignInInitial extends SignInState {
  SignInInitial({
    required super.emailError,
    required super.emailController,
    required super.passwordController,
    required super.emailFocus,
    required super.passwordFocus,
  });
}

class SignInLoading extends SignInState {
  SignInLoading({
    required super.emailError,
    required super.emailController,
    required super.passwordController,
    required super.emailFocus,
    required super.passwordFocus,
  });
}

class SignInSuccess extends SignInState {
  SignInSuccess({
    required super.emailError,
    required super.emailController,
    required super.passwordController,
    required super.emailFocus,
    required super.passwordFocus,
  });
}

class SignInError extends SignInState {
  @override
  final String errorMessage;
  SignInError({
    required this.errorMessage,
    required super.emailError,
    required super.emailController,
    required super.passwordController,
    required super.emailFocus,
    required super.passwordFocus,
  });
}
