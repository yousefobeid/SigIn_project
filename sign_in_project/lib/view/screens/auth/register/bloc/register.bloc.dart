import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/remote/register_remote.dart';
import 'package:sign_in_project/view/screens/auth/register/bloc/register.state.dart';
import 'package:sign_in_project/view/screens/auth/register/bloc/register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRemote registerRemote;
  RegisterBloc(this.registerRemote) : super(RegisterState('', '', '', '')) {
    // ignore: unused_element
    Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
      if (event is CheckUserExistEvent) {
        yield* _handleCheckUserExist(event);
      } else if (event is RegisterUserEvent) {
        yield* _handleRegisterUser(event);
      }
    }

    on<UserNameEvent>(_handleUserNameEvent);
    on<EmailEvent>(_handleEmailEvent);
    on<PasswordEvent>(_handlePasswordEvent);
    on<RePasswordEvent>(_handleRePasswordEvent);
    on<ValidateRegister>(_handleValidate);
    on<IsLoading>((event, emit) {
      emit(state.copyWith(isLoading: true));
    });
  }
  // It receives an event from the UI (like typing in a text field).
  // It prints the value (for debugging).
  // It updates the state using copyWith.
  void _handleUserNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _handleEmailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _handlePasswordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _handleRePasswordEvent(
    RePasswordEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(rePassword: event.rePassword));
  }

  Stream<RegisterState> _handleCheckUserExist(
    CheckUserExistEvent event,
  ) async* {
    yield RegisterLoading('', '', '', '');
    try {
      final result = await registerRemote.checkUserExists(
        userModel: event.userModel,
      );

      if (result['status'] == 'aleady exist') {
        yield RegisterFailure("User already exists.");
      } else {
        yield RegisterSuccess("User can be registered.");
      }
    } catch (e) {
      print("============================> $e");
      yield RegisterFailure("An error occurred during check.");
    }
  }

  Stream<RegisterState> _handleRegisterUser(RegisterUserEvent event) async* {
    yield RegisterLoading('', '', '', '');
    try {
      final result = await registerRemote.signUp(data: event.userModel);
      if (result == 'Success') {
        yield RegisterSuccess("Registration successful!");
      } else {
        yield RegisterFailure("Registration failed.");
      }
    } catch (e) {
      print("============================> $e");
      yield RegisterFailure("An error occurred during registration.");
    }
  }

  void _handleValidate(
    ValidateRegister event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final email = state.email;
    final userName = state.userName;
    final rePassword = state.rePassword;
    final password = state.password;
    // final isLoading= state.isLoading;
    String emailError = '';
    String passwordError = '';
    String userNameError = '';
    String rePasswordError = '';

    if (userName.isEmpty) {
      userNameError = 'User name cannot be empty';
    } else if (userName.length < 3) {
      userNameError = 'User name must be at least 3 characters long';
    }
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
    if (rePassword.isEmpty) {
      rePasswordError = 'Please confirm your password';
    } else if (rePassword != password) {
      rePasswordError = 'Passwords do not match';
    }
    final hasError =
        userNameError.isNotEmpty ||
        emailError.isNotEmpty ||
        passwordError.isNotEmpty ||
        rePasswordError.isNotEmpty;
    emit(
      state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        userNameError: userNameError,
        rePasswordError: rePasswordError,
        hasValidationPassed: !hasError,
        isLoading: false,
      ),
    );
  }
}
