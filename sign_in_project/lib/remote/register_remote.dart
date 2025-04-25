import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_project/model/sign_in_model.dart';
import 'package:sign_in_project/service/service.dart';

class RegisterRemote {
  RegisterRemote();
  Future<Map<String, dynamic>> checkUserExists({
    //which contains the user's info like email and username.
    required SignInModel userModel,
  }) async {
    try {
      final useRref = MyServices().firebaseFirestore.collection("user");
      var emailQuery =
          useRref.where('email', isEqualTo: userModel.email).limit(1).get();
      var userNameQuery =
          useRref
              .where('username', isEqualTo: userModel.username)
              .limit(1)
              .get();

      //Executes both queries at the same time using Future.wait (faster than waiting for them one by one).
      var result = await Future.wait([userNameQuery, emailQuery]);
      //Checks if either query returned any results
      bool userNameExist = result[0].docs.isNotEmpty;
      bool emailExist = result[1].docs.isNotEmpty;

      if (userNameExist || emailExist) {
        return {
          "status": "aleady exist",
          'userNameExists': userNameExist,
          'emailExists': emailExist,
        };
      } else {
        return {"status": "Success"};
      }
    } catch (e) {
      print("error check client exist ========================== $e");
      return {"status": "Failure"};
    }
  }

  signUp({required SignInModel data}) async {
    try {
      Map<String, dynamic> requestData = data.toMap();
      requestData.remove("userId");

      var docRef = await MyServices().firebaseFirestore
          .collection("user")
          .add(requestData);
      String userId = docRef.id;
      data.userId = userId;
      print("User Id $userId");
      if (userId.isNotEmpty) {
        SharedPreferences prefs = MyServices().sharedPreferences;
        String userInfo = jsonEncode(data.toJson());
        await prefs.setString("localDateKey", userInfo);
        return "Success";
      }
    } catch (e) {
      print("Error ===============> $e");
      return null;
    }
  }
}
