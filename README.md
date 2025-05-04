
# 🚀 EMCUS - Flutter App

A modular, scalable Flutter application with Firebase authentication, persistent login using SharedPreferences, and a clean architecture using feature-first folder structure.

> ⚙️ Built with Firebase, Provider, and SharedPreferences

---

<<<<<<< HEAD
## 📸 Video-Demo

[ https://drive.google.com/drive/folders/1TAeVSqBktK0HYePnh6-CAMjofe7OS6Di?usp=sharing ]
=======
## 📸 Demo

https://drive.google.com/drive/folders/1TAeVSqBktK0HYePnh6-CAMjofe7OS6Di?usp=sharing
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
🧪 Includes authentication, splash logic, login persistence, and bottom navigation.

---

<<<<<<< HEAD
## 📸 EMCUS APK

[ https://drive.google.com/drive/folders/1A1mroUaIXFIJcIsi1HPQRgMlj_LowaM9?usp=drive_link ]

---

=======
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
## 📁 Project Structure

```
lib/
├── app.dart                      # App entry point
├── base/                         # Core themes, widgets, and constants
├── features/                     # Feature-first module structure
│   ├── auth/                     # Authentication (login, signup)
│   │   ├── provider/             # State management with Provider
│   │   ├── repo/                 # Authentication repository
│   │   ├── route/                # Routes related to auth
<<<<<<< HEAD
│   │   └── view/                 # Auth-related UI screens
=======
│   │   └── view/                 # Auth-related UI screens ( login,signup)
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
│   ├── bottom_nav/               # Bottom navigation handling
│   ├── daignostics/              # Diagnostics screen
│   ├── dashboard/                # Dashboard & home views
│   ├── lending/                  # Lending-related views
│   ├── maintenance/              # Maintenance section
│   ├── setting/                  # Settings screen
│   └── splash/                   # Splash screen & logic
├── utils/                        # Utilities like SharedPreferences helpers
```

---

## ✅ Features

- 🔐 Firebase Email/Password Authentication
- ⏳ Splash Screen with Persistent Login
- 💾 SharedPreferences for Local Storage
- 🧭 Bottom Navigation for Main Screens
- 📦 Clean Feature-First Architecture
- 📱 Android Release Build Included

---

## 🔧 Setup & Firebase Integration

### Prerequisites

- Flutter SDK
- Firebase account
- Android Studio / Xcode

### Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create a new project
3. Enable **Email/Password Authentication**
4. Download config files:
<<<<<<< HEAD
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
=======
    - `google-services.json` → `android/app/`
    - `GoogleService-Info.plist` → `ios/Runner/`
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
5. Add Firebase dependencies:

```yaml
dependencies:
  firebase_core: ^2.27.0
  firebase_auth: ^4.16.0
  provider: ^6.1.2
  shared_preferences: ^2.2.2
```

6. Initialize Firebase in `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const EMCUSApp());
}
```

---

## 🏃 Getting Started

```bash
<<<<<<< HEAD
git clone https://github.com/gauravsarvaiya/EMCUS_APP.git
=======
git clone https://github.com/your-username/emcus-flutter-app.git
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
cd emcus-flutter-app
flutter pub get
flutter run
```

✅ Make sure Firebase config files are in place before running.

---

## 🧪 Build APK

Generate release build:

```bash
flutter build apk --release
```

<<<<<<< HEAD
Final APK will be available at:  
=======
Final APK will be available at:
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
```
build/app/outputs/flutter-apk/app-release.apk
```

✅ Prebuilt release APK also included in `/release` folder.

---

## 🗺️ Navigation Flow

```plaintext
SplashScreen
  ↓
Check Login with SharedPreferences
  ↓
If Logged In → BottomNavScreen
Else → LoginScreen
```

---
<<<<<<< HEAD
=======

## 📸 Screenshots

| Splash | Login | Dashboard |
|--------|-------|-----------|
| ![Splash](assets/screens/splash.png) | ![Login](assets/screens/login.png) | ![Dashboard](assets/screens/dashboard.png) |

---

>>>>>>> f2c92a5 (Initial commit with full Flutter source code)
## 📄 License

MIT License.  
See `LICENSE` file for details.

---

## 👤 Author

<<<<<<< HEAD
**Gaurav Sarvaiya**

- GitHub: [@gauravsarvaiya](https://github.com/gauravsarvaiya)
- LinkedIn: [Gaurav Sarvaiya](https://www.linkedin.com/in/sgauravdev/)
=======
**Gaurav Saroja**

- GitHub: [@gauravsarvaiya](https://github.com/gauravsarvaiya)
- LinkedIn: [Gaurav Saroja](https://linkedin.com/in/sgauravdev/)

---
>>>>>>> f2c92a5 (Initial commit with full Flutter source code)


