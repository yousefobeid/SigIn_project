import 'package:sign_in_project/model/sign_in_model.dart';

abstract class RegisterEvent {}

class UserNameEvent extends RegisterEvent {
  final String userName;
  UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;
  PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvent {
  final String rePassword;
  RePasswordEvent(this.rePassword);
}

class ValidateRegister extends RegisterEvent {}

class IsLoading extends RegisterEvent {}

class CheckUserExistEvent extends RegisterEvent {
  final SignInModel userModel;

  CheckUserExistEvent(this.userModel);
}

class RegisterUserEvent extends RegisterEvent {
  final SignInModel userModel;

  RegisterUserEvent(this.userModel);
}
