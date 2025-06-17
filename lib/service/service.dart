import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices {
  static final MyServices _instance = MyServices._internal();
  late SharedPreferences sharedPreferences;
  late FirebaseFirestore firebaseFirestore;

  factory MyServices() {
    // always return the same object
    return _instance;
  }
  //private constructor
  MyServices._internal();

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    firebaseFirestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  }

  // Future<MyServices> initializeServices() async {
  //   FirebaseFirestore.instance.settings = const Settings(
  //     persistenceEnabled: true,
  //   );

  //   return this;
  // }

  // Future<void> saveEmail(String email) async {
  //   await sharedPreferences.setString('email', email);
  // }

  // Future<void> savePassword(String password) async {
  //   await sharedPreferences.setString('password', password);
  // }

  // String? getEmail() {
  //   return sharedPreferences.getString('email');
  // }

  // String? getPassword() {
  //   return sharedPreferences.getString('password');
  // }

  // Future<void> clear() async {
  //   await sharedPreferences.clear();
  // }
}
//singltoun