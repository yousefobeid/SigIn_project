abstract class HomeState {}

class AuthInitial extends HomeState {}

class AuthLoggedOut extends HomeState {}

class AuthError extends HomeState {
  final String message;
  AuthError(this.message);
}
