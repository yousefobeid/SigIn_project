# 🔐 Sign In Project – Flutter + Firebase + BLoC


A clean, testable, and scalable **sign-in/sign-up** Flutter application built with **Firebase Authentication**, **BLoC state management**, and **Stateless UI** architecture.
---

## 🚀 Features

- 🔥 Firebase Authentication (Email/Password)
  
- 🧼 Clean architecture (presentation, domain, data layers)
  
- 💡 Stateless UI powered by Cubit/BLoC
  
- 📦 SharedPreferences for local session storage
  
- ✅ Form validation with error states
  
- 🔄 Loading indicators and error handling

- 🧪 Ready for unit & integration testing
  

## 🧱 Project Structure

lib/

├── auth/ # Authentication logic (sign in/up/reset)

│ ├── bloc/ # BLoC & Cubit logic for auth

│ ├── data/ # Firebase Auth services

│ ├── models/ # User and auth models

│ └── views/ # SignInPage, SignUpPage, etc.

├── core/ # Shared utils (validators, constants)

├── home/ # HomePage after login

├── main.dart # App entry point

└── routes/ # AppRoute generator

test/

├── unit/ # Unit tests for validation, cubits

└── integration_test/ # End-to-end tests for flows

نسخ
ت

## 🛠 Getting Started


1. **Clone the repo**

   git clone https://github.com/your-username/sign_in_project.git
   
   cd sign_in_project
   
Set up Firebase

Create a project on Firebase Console

Enable Email/Password authentication

Download google-services.json and place it in android/app/

(If using iOS: set up GoogleService-Info.plist accordingly)

Install dependencies
نسخ
تحرير
flutter pub get

Run the app
نسخ
تحرير
flutter run

🧪 Testing

✅ Unit Tests

Test auth cubits and validators:
نسخ
تحرير
flutter test test/unit/

✅ Integration Tests

Test full sign-in/sign-up flows:
نسخ
تحرير
flutter test integration_test/

🔐 Authentication Flow

SignInPage validates input and triggers SignInCubit

SignInCubit calls AuthRepository

AuthRepository interacts with FirebaseAuth

On success: navigates to HomePage and stores token in SharedPreferences

✨ Future Enhancements

Google Sign-In

Email verification

Forgot password flow

Better error translations

🧑‍💻 Author

Yousef Obid – Flutter Developer\

🔗 LinkedIn[https://www.linkedin.com/in/yousef-obid-9301052b5/]

📧 yousefobid521@gmail.com

