import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/service/service.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckAuthEvent>(handleCheckAuthEvent);
  }

  handleCheckAuthEvent(CheckAuthEvent event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 5));
    final prefs = MyServices().sharedPreferences;
    final String? localData = prefs.getString("localDateKey");
    if (localData != null) {
      try {
        final Map<String, dynamic> userMap = jsonDecode(localData);
        final signInModel = SignInModel.fromMap(userMap);
        if (signInModel.userId.isNotEmpty) {
          emit(SplashAuthenticated());
        } else {
          emit(SplashUnauthenticated());
        }
      } catch (e) {
        print("Error decoding JSON: $e");
        emit(SplashUnauthenticated());
      }
    } else {
      emit(SplashUnauthenticated());
    }
  }
}
