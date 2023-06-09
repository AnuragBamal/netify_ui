# netify

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## GenerateJsonCode:

flutter pub run build_runner build --delete-conflicting-outputs
flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

1. APICLient
2. Repository
3. Request
4. Response
4. remote_data_source
5. repository_implementor

## Builld from Repo
1. cd repo
2. flutter pub get
3. flutter pub run build_runner build --delete-conflicting-outputs
4. flutter create .
5. Build the project. Now you can build the project for the platform of your choice using one of the flutter build commands. For example, flutter build ios will build the project for iOS, and flutter build apk will build the project for Android.
        flutter build ios
                # or
        flutter build apk

## Build Errors
If build error are happening relation to some version in gradle file try check and update netify_ui/android/gradle/wrapper/gradle-wrapper.properties


