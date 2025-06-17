import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_project/view/screens/splash/bloc/splash_bloc.dart';
import 'package:sign_in_project/view/screens/splash/bloc/splash_event.dart';
import 'package:sign_in_project/view/screens/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(CheckAuthEvent());
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          Navigator.of(context).pushNamed("/home");
        } else if (state is SplashUnauthenticated) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil("/signIn", (context) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset(
            "assets/image/splash.gif",
            height: 250.h,
            width: 250.h,
          ),
        ),
      ),
    );
  }
}
