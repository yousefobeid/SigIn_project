class SignInModel {
  String userId;
  final String username;
  final String password;
  final String rePassword;
  final String email;

  SignInModel({
    required this.userId,
    required this.username,
    required this.password,
    required this.rePassword,
    required this.email,
  });
  // static Timestamp? parseTimestamp(dynamic value) {
  //   if (value == null) return null;
  //   if (value is Timestamp) return value;
  //   if (value is String) return Timestamp.fromDate(DateTime.parse(value));
  //   return null;
  // }

  //This is used to convert a map to a user object.
  // This step is needed to convert data that comes from Firestore or an API (usually in JSON format) into a Dart UserModel object that you can actually work with in your app.
  factory SignInModel.fromMap(Map<String, dynamic> data) {
    //factory means it's a special constructor that returns an instance, not directly creates one.
    // if (data.containsKey('userId') &&
    //     data.containsKey('username') &&
    //     data.containsKey('password') &&
    //     data.containsKey('rePassword') &&
    //     data.containsKey('email') &&
    //     data.containsKey('logedInDate') &&
    //     data.containsKey('isLogedIn'))
    // {
    // Model Creation
    return SignInModel(
      userId: data['userId'] ?? "",
      username: data['username'] ?? "",
      password: data['password'] ?? "",
      rePassword: data['rePassword'] ?? "",
      email: data['email'] ?? "",
    );
    // } else {
    //   throw ArgumentError('Missing required fields in data map');
    // }
  }
  //This converts the object back into a map.
  // Save it in SharedPreferences
  // Send it to Firebase
  // Encode it to JSON
  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "userId": userId,
      "password": password,
      "rePassword": rePassword,
      "email": email,
    };
  }

  //Storing user data
  // Firebase
  // SharedPreferences
  // LocalStorage You need to convert objects to JSON.

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "userId": userId,
      "password": password,
      "rePassword": rePassword,
      "email": email,
    };
  }
}
