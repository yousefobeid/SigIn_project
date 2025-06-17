abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);
}

class ValidateEmailAndPassword extends SignInEvent {}

class ResetValidationEvent extends SignInEvent {}

class SignInSubmitted extends SignInEvent {}

class SignInButtonPressed extends SignInEvent {
  final String email;
  final String password;

  SignInButtonPressed({required this.email, required this.password});
}
