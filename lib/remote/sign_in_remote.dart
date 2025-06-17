import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/service/service.dart';

class SignInRemoteData {
  SignInRemoteData();
  late BuildContext context;
  login({
    required SignInModel data,
    String? from,
    // required BuildContext context,
  }) async {
    try {
      QuerySnapshot snapshot =
          await MyServices().firebaseFirestore
              .collection("user")
              .where("email", isEqualTo: data.email)
              .where("password", isEqualTo: data.password)
              .get();
      print("11111111111111111111");
      if (snapshot.docs.isNotEmpty) {
        var doc = snapshot.docs.first;
        // if (from == "signIn") {
        //   await doc.reference.update({"isLogedIn": true});
        //   // await doc.reference.update({"logedInDate": data.logedInDate});
        //   print("2222222222222222222222222222222");
        //   // Navigator.of(context).pushNamed("/home");
        //   // await doc.reference.update({"rememberMe": data.rememberMe});
        // }
        return doc;
      } else {
        return null;
      }
    } catch (e) {
      print("Error ===============> $e");
    }
  }

  // logOut({required String userId}) async {
  //   try {
  //     await MyServices().firebaseFirestore
  //         .collection("user")
  //         .doc(userId)
  //         .update({"isLogedIn": false});
  //     String? localData = MyServices().sharedPreferences.getString(
  //       "localDateKey",
  //     );
  //     print("333333333333333333333333333333333333");

  //     if (localData != null) {
  //       Map<String, dynamic> jsonData = jsonDecode(localData);
  //       jsonData["isLogedIn"] = false;
  //       MyServices().sharedPreferences.setString(
  //         "localDateKey",
  //         jsonEncode(jsonData),
  //       );
  //       print("44444444444444444444444444444444");

  //       return "Success";
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print("error ================== $e");
  //     return null;
  //   }
  // }
}
