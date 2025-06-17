import 'package:sign_in_project/service/service.dart';

class HomeRemote {
  HomeRemote();
}

Future<String?> logOut({required String userId}) async {
  try {
    // Optionally: Sign out from Firebase or update status
    MyServices().firebaseFirestore.collection("user").doc(userId);

    // Remove user data from SharedPreferences
    final prefs = MyServices().sharedPreferences;
    await prefs.remove("localDateKey");
    print("User logged out and data removed from SharedPreferences.");
    return "Success";
  } catch (e) {
    print("Logout error ================== $e");
    return null;
  }
}
