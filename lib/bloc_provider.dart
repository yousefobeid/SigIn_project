import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/remote/register_remote.dart';
import 'package:sign_in_project/remote/sign_in_remote.dart';
import 'package:sign_in_project/view/screens/auth/register/bloc/register.bloc.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sign_in_project/view/screens/boarding/bloc/welcome_bloc.dart';
import 'package:sign_in_project/view/screens/home/bloc/home_bloc.dart';
import 'package:sign_in_project/view/screens/splash/bloc/splash_bloc.dart';

class AppBlocProvider {
  get allBlocProviders => [
    // Removed SplashScreen as it is not a Bloc
    // Replace with the correct Bloc if needed
    // BlocProvider(lazy: false, create: (context) => SplashBloc()),
    BlocProvider(lazy: false, create: (context) => SplashBloc()),
    BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
    BlocProvider(create: (context) => SignInBloc(SignInRemoteData(), context)),
    BlocProvider(create: (context) => RegisterBloc(RegisterRemote())),
    BlocProvider(lazy: false, create: (context) => HomeBloc()),
  ];
}
