import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in_project/core/constant/color.dart';
import 'package:sign_in_project/view/screens/boarding/bloc/welcome_bloc.dart';
import 'package:sign_in_project/view/screens/boarding/bloc/welcome_event.dart';
import 'package:sign_in_project/view/screens/boarding/bloc/welcome_state.dart';
import 'package:sign_in_project/view/screens/boarding/widget/bording_welcome.dart';

class WelcomePage extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);
  WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder:
            (context, state) => Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    print(value);
                    state.page =
                        value; // tries to update the BLoC state directly
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    //This adds a WelcomeEvent, which your WelcomeBloc listens to.
                  },
                  children: [
                    BordingWelcome(
                      imagePath: 'assets/image/learning.jpg',
                      title: 'First See Learning',
                      description:
                          'Forget About A For Of Paper All Knowledge In One Learning',
                      index: 1,
                      buttonName: 'Next',
                      onPressed: () {
                        pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                    BordingWelcome(
                      buttonName: "Next",
                      index: 2,
                      imagePath: 'assets/image/learning2.png',
                      title: 'Connect With Everyone',
                      description: 'Connect With Everyone In One Place',
                      onPressed: () {
                        pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                    BordingWelcome(
                      buttonName: "Get Started",
                      index: 3,
                      imagePath: 'assets/image/learning3.png',
                      title: 'Always Learning',
                      description: 'Anywhere Anytime Learning',
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamedAndRemoveUntil("/signIn", (route) => false);
                      },
                    ),
                  ],
                ),
                Align(
                  // alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 620),
                    child: DotsIndicator(
                      position: state.page.toDouble(),
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        size: Size.square(8),
                        activeColor: AppColors.primaryElement,
                        activeSize: Size(20, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
