import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_project/bloc_provider.dart';
import 'package:sign_in_project/core/constant/color.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/service/service.dart';
import 'package:sign_in_project/view/screens/auth/register/register.dart';
import 'package:sign_in_project/view/screens/auth/sign_in/sign_in.dart';
import 'package:sign_in_project/view/screens/home/home_page.dart';
import 'package:sign_in_project/view/screens/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MyServices().init();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider().allBlocProviders,
      child: ScreenUtilInit(
        builder:
            (context, child) => MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText),
                  elevation: 0,
                  backgroundColor: AppColors.primarySecondaryBackground,
                ),
              ),
              home: SplashScreen(),
              // (FirebaseAuth.instance.currentUser != null &&
              //         FirebaseAuth.instance.currentUser!.emailVerified)
              //     ? HomePage()
              //     : SignIn(),
              debugShowCheckedModeBanner: false,
              routes: {
                "/signIn": (context) => SignIn(),
                "/register":
                    (context) => Register(
                      userModel: SignInModel(
                        userId: '',
                        username: '',
                        email: "",
                        password: "",
                        rePassword: "",
                      ),
                    ),
                "/home": (context) => HomePage(),
              },
            ),
      ),
    );
  }
}
