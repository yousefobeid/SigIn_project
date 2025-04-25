import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/view/screens/boarding/widget/custom_button.dart';
import 'package:sign_in_project/view/screens/home/bloc/home_bloc.dart';
import 'package:sign_in_project/view/screens/home/bloc/home_event.dart';
import 'package:sign_in_project/view/screens/home/bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil("/signIn", (route) => false);
        } else {
          print("ggggggggggggggggggggggggggggg");
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: Center(
          child: CustomButton(
            buttonName: "Sign Out",
            onPressed: () {
              context.read<HomeBloc>().add(LogOutEvent());
            },
          ),
        ),
      ),
    );
  }
}
