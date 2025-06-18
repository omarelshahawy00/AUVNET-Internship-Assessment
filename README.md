# AUVNET Internship Assessment

This repository contains the complete Flutter application built as part of the AUVNET Internship Assessment. The project showcases clean architecture, Firebase integration, Bloc state management, and modular, scalable development patterns.

---
### 📝 Deliverables Summary
### ✅ Complete source code uploaded to this GitHub repository.

### ✅ Clean code and folder structure following Clean Architecture.

### ✅ Firebase integration and user authentication.

### ✅ This detailed README.md explaining:

Project setup and installation

Project architecture and rationale

## 🚀 Project Setup and Installation Guide

Follow the steps below to set up and run the project locally:

### ✅ Prerequisites

Make sure the following are installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK (comes with Flutter)
- Android Studio or Visual Studio Code
- Git
- Firebase CLI (if modifying Firebase setup)

### 📥 Clone the Repository

```bash
git clone https://github.com/omarelshahawy00/AUVNET-Internship-Assessment.git
cd AUVNET-Internship-Assessment
```
### 📦 Install Dependencies

```bash
flutter pub get
```
### 🔥 Firebase Configuration
Go to Firebase Console

Create a new project.

Register your app with your package name.

Download google-services.json and place it in android/app/

Enable Firebase services you are using (e.g., Authentication, Firestore).

(Optional) Run:
```bash
flutterfire configure
```
### ▶️ Run the App
To launch the app on an emulator or physical device:

```bash
flutter run
```
To build APK:
```bash
flutter build apk
```
🧱 Project Layers Breakdown
This Flutter application follows a Clean Architecture approach to promote separation of concerns, testability, and maintainability.

Here is a detailed explanation of each layer and its responsibility:

### 📁 lib/core/ – Core Layer
Contains app-wide constants, utilities, base classes, and shared services.


- di/ – Dependency injection configuration (e.g., getIt setup).

- errors/ – Failure & Exception models (e.g., Firebase error wrapper).

- functions/, helpers/, utils/ – Reusable utility functions or extensions.

- network/ – API constants, base services, and network check logic.

- theme/ – App-wide styling and color configuration.

- widgets/ – Common shared widgets like buttons, loaders, etc.

### 📁 lib/features/ – Feature Layer
Each feature follows Clean Architecture (Data → Domain → Presentation):


### 🔐 auth/ – Authentication Module
- data/ – Implements repositories, models, and remote/local data sources.

- domain/ – Contains the abstract repository .

- log_in/, sign_up/ – Presentation logic split by auth type (e.g., BLoC + UI).

- manager/ –  contain bloc managers .
  

### 🏠 home/ – Home/Dashboard Module
- data/ – Fetches user data (e.g., HomeRemoteDataSource, UserModel).

- domain/ – Defines abstract user repository.

- presentation/ – Displays UI (e.g., HeaderCard) and handles BLoC events/states.

### 📁 lib/navigation/, lib/onboarding/, lib/splash/
Other screens/features that don't require full domain/data structure but are isolated for modularity and navigation.

### 📄 main.dart
The entry point of the app. Sets up dependency injection, routing, and initializes Firebase.


### 👤 Author
Omar Elshahawy
### 📧 omar.elshahawy00@gmail.com
### 🌐 [GitHub Profile](https://github.com/omarelshahawy00)
