import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/service/service.dart';
import 'package:sign_in_project/view/screens/home/bloc/home_event.dart';
import 'package:sign_in_project/view/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(AuthInitial()) {
    on<LogOutEvent>(handleLogout);
  }
}

Future<void> handleLogout(LogOutEvent event, Emitter<HomeState> emit) async {
  try {
    final prefs = MyServices().sharedPreferences;

    // Remove local data
    await prefs.remove("localDateKey");

    emit(AuthLoggedOut());
  } catch (e) {
    print("Logout error ====> $e");
    emit(AuthError("Logout failed. Please try again."));
  }
}
