class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;
  final String userNameError;
  final String emailError;
  final String passwordError;
  final String rePasswordError;
  final bool hasValidationPassed;
  final bool isLoading;

  RegisterState(
    this.userNameError,
    this.emailError,
    this.passwordError,
    this.rePasswordError, {
    this.userName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
    this.hasValidationPassed = false,
    this.isLoading = false,
  });
  //copyWith create a new version of the RegisterState
  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
    String? userNameError,
    String? emailError,
    String? passwordError,
    String? rePasswordError,
    bool? hasValidationPassed,
    bool? isLoading,
  }) {
    return RegisterState(
      // String name = newName ?? oldName;
      // If newName = "Ali", then name will be "Ali"
      // If newName = null, then name will be oldName
      userNameError ?? this.userNameError,
      emailError ?? this.emailError,
      passwordError ?? this.passwordError,
      rePasswordError ?? this.rePasswordError,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      hasValidationPassed: hasValidationPassed ?? this.hasValidationPassed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class RegisterInitial extends RegisterState {
  RegisterInitial() : super('', '', '', '');
}

class RegisterLoading extends RegisterState {
  RegisterLoading(
    super.userNameError,
    super.emailError,
    super.passwordError,
    super.rePasswordError,
  );
}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess(this.message) : super('', '', '', '');
}

class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure(this.error) : super('', '', '', '');
}
