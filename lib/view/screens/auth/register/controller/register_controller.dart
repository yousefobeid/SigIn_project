// import 'package:flutter/material.dart';
// import 'package:sign_in_project/model/sign_in_model.dart';
// import 'package:sign_in_project/remote/register_remote.dart';

// class RegisterController {
//   //Access inherited widgets EX:BlocProvider
//   final BuildContext context;
//   TextEditingController userNameComtroller = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController rePasswordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   RegisterController(this.context);
//   final RegisterRemote registerRemote = RegisterRemote();
//   goToVerifyEmail() async {
//     SignInModel user = SignInModel(
//       userId: '',
//       username: userNameComtroller.text,
//       email: emailController.text,
//       password: passwordController.text,
//       rePassword: rePasswordController.text,
//     );
//   }

//   // void createEmailAndPassword() async {
//   //   //Access the state of the BlocProvider
//   //   // we can read what the user typed (email and password).
//   //   final state = context.read<RegisterBloc>().state;
//   //   context.read<RegisterBloc>().emit(state.copyWith(isLoading: true));

//   //   try {
//   //     final email = state.email;
//   //     final password = state.password;
//   //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );

//   //     final user = FirebaseAuth.instance.currentUser;
//   //     if (user != null && !user.emailVerified) {
//   //       await user.sendEmailVerification();
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text("Verification email sent")),
//   //       );
//   //     }
//   //     ScaffoldMessenger.of(
//   //       context,
//   //     ).showSnackBar(const SnackBar(content: Text("Registration successful")));

//   //     Navigator.of(context).pushReplacementNamed("/signIn");
//   //   } on FirebaseAuthException catch (e) {
//   //     ScaffoldMessenger.of(
//   //       context,
//   //     ).showSnackBar(SnackBar(content: Text("Error: ${e.message}")));
//   //   } finally {
//   //     context.read<RegisterBloc>().emit(state.copyWith(isLoading: false));
//   //   }
//   // }
// }
