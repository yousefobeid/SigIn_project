import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/view/screens/boarding/bloc/welcome_event.dart';
import 'package:sign_in_project/view/screens/boarding/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  //Listens to WelcomeEvent
  //Updates the UI via WelcomeState
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
    // on<PageChangedEvent>((event, emit) {
    //   emit(WelcomeState(page: event.page));
    // });
    // on<PageChangedEvent>((event, emit) {
    //   emit(state.copyWith(currentPage: event.pageIndex));
    // });
  }
}
