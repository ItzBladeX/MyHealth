# MyHealth Project Documentation

## Scope

This document describes the Flutter application in `frontend/app` only. It covers the client-side structure, user flows, local persistence, Android integration, and development workflow. It does not document the separate backend or treat backend behavior as part of the app's current runtime.

## What the app does

MyHealth is a personal health and wellness app. Its current screens let a user create an account or sign in, view and edit basic profile and medical-ID details, maintain allergy and chronic-condition entries, record medical visits, track water intake, and—on Android devices with permission—review device usage summaries.

The app is built with Flutter and Dart. Its UI is organized around four bottom-navigation destinations: Home, Appointments, History, and Profile. Appointments is currently a placeholder screen; the other destinations have working screen implementations connected to local app state or storage.

## Starting the app

The Flutter package root is `frontend/app`. From a terminal, enter that directory, fetch dependencies, and run the app on a connected device or available emulator:

```sh
cd frontend/app
flutter pub get
flutter run
```

The package requires Dart SDK `^3.13.2`, as declared in [pubspec.yaml](frontend/app/pubspec.yaml). Flutter tooling and a configured target device are also required. For Android, the screen-usage feature additionally relies on Android's Usage Access permission; the rest of the app does not require it.

## App startup and navigation

The entry point is [main.dart](frontend/app/lib/main.dart). `main()` launches `MyApp`, which configures a Material 3 theme, uses `Plus Jakarta Sans` text styling, and registers providers with `MultiProvider`. A Drift database is made available through Provider and closed when the provider is disposed. The app also registers the global `AuthProvider` and a `UserProvider`.

The first screen is an animated splash screen. It displays the app logo and name, then transitions to `Shell`. The shell observes authentication state and displays either the authentication page or the main app. The main app and its navigation destinations are implemented in [app_page.dart](frontend/app/lib/app_page.dart): a `NavigationBar` switches between `Home`, `Appointments`, `History`, and `Profile` without replacing the overall app shell.

Shared colors and the local API endpoint constants are in [constants.dart](frontend/app/lib/core/constants.dart). The shared app-bar widget is in [app_bar.dart](frontend/app/lib/app_bar.dart).

## Main screens and user workflows

### Authentication

The sign-in and account-creation page is [auth.dart](frontend/app/lib/features/auth/presentation/screens/auth.dart). It switches between the two forms using a shared toggle and form container. The widgets for the welcome content, toggle, login form, and registration form live under `frontend/app/lib/features/auth/presentation/widgets/`.

Phone validation currently expects an Ethiopian number in the `+251` format, beginning with `9` or `7`, followed by eight digits. Password validation requires more than four non-whitespace characters. Registration also collects a full name. Passwords saved locally are hashed and checked with bcrypt through [cryptography.dart](frontend/app/lib/utils/cryptography.dart); the local user record stores the hash, not the plaintext password.

Authentication has both remote-service code and a local mode. The HTTP calls are defined in [auth_services.dart](frontend/app/lib/services/auth_services.dart), with their base URL in [constants.dart](frontend/app/lib/core/constants.dart). The active login path in [auth_provider.dart](frontend/app/lib/providers/auth_provider.dart), however, verifies the credentials against the local Drift database. Account creation attempts the remote registration call and has a local account fallback when that attempt throws or does not return the expected token. The current client therefore should not be assumed to have a complete, working server-backed login/session flow.

### Home and wellness

The Home screen is composed in [home_screen.dart](frontend/app/lib/features/home/presentation/screens/home_screen.dart). It contains:

- A hydration tracker, which adds or subtracts 250 ml per tap toward a default goal of 2,000 ml. Intake is stored in Shared Preferences under one persistent key. The code uses 1,500 ml when no saved value exists; it does not implement a date-based daily reset.
- A patient-baseline summary for profile and health information, such as blood type, allergies, and chronic conditions.
- Usage summary cards. These are populated from Android usage data when the device permission has been granted.

The Home widgets are grouped in `frontend/app/lib/features/home/presentation/widgets/` by purpose, including hydration, patient baseline, and usage tracking. A step-tracker widget exists in the source but is currently commented out of the Home screen.

### Medical history

The History destination is assembled in [history_screen.dart](frontend/app/lib/features/history/presentation/screens/history_screen.dart). Users can create and edit records describing a hospital or clinic, visit date, diagnosis, notes, and prescription, and can delete records. The records are stored locally and observed as a stream, so the list can update when the database changes. The related presentation widgets are under `frontend/app/lib/features/history/presentation/widegts/` (the directory name is spelled `widegts` in the current source).

Some visible controls are not complete workflows: the search field does not currently filter records, and the download action is a placeholder.

### Profile and medical ID

The Profile screen is assembled in [profile_screen.dart](frontend/app/lib/features/profile/presentation/screens/profile_screen.dart). It presents the user's profile, medical ID, allergy/condition entries, permission-related options, and logout. Profile data includes name and phone number; the editable medical details include birth date, blood type, weight, and height. Allergy and condition entries have a name and severity/category, and can be added or deleted.

Some profile controls are currently presentational rather than integrated with device capabilities: the sharing and language options do not perform those actions, and the biometric switch only changes its UI state. Logout clears the in-memory user UUID in the current authentication provider.

### Appointments

Appointments is included in the bottom navigation for future use, but currently displays placeholder text rather than an appointment-management feature.

## State management and persistence

The app uses Provider for dependency injection and reactive state. `AuthProvider` holds the current in-memory user UUID and token-related methods. `UserProvider` loads profile, baseline, allergy, and medical-history data through service streams, and retrieves usage data when requested. The provider and service implementations are in [auth_provider.dart](frontend/app/lib/providers/auth_provider.dart), [user_provider.dart](frontend/app/lib/providers/user_provider.dart), and [user_services.dart](frontend/app/lib/services/user_services.dart).

The local Drift/SQLite schema is declared in [user_model.dart](frontend/app/lib/models/user_model.dart). It contains four tables:

| Table | Purpose |
| --- | --- |
| `User` | User UUID, full name, password hash, and unique phone number. |
| `UserData` | Optional height, weight, blood type, and birth date. |
| `UserAllergies` | Allergy/condition name and severity/category, keyed by user and name. |
| `UserMedicalHistory` | Dated hospital/clinic records with diagnosis and optional notes and prescription. |

The database connection and file location are configured in [database.dart](frontend/app/lib/database/database.dart), with a shared database instance exposed by [get_db.dart](frontend/app/lib/database/get_db.dart). In desktop debug builds the SQLite file is placed in the current working directory; other native builds use the application's documents directory. The schema currently reports version 1.

Hydration is stored separately using Shared Preferences. A secure-storage wrapper for an authentication token is also defined, but the active local login flow does not persist a token, and the startup path does not currently restore a session by calling `loadSession()`.

## Android device-usage integration

Android usage data crosses the Flutter/native boundary through the `com.myhealth.app/stats` MethodChannel. The Flutter service requests permission status and converts native results into screen-on, screen-off, and per-app usage values. The native implementation is in [MainActivity.kt](frontend/app/android/app/src/main/kotlin/com/myhealth/app/MainActivity.kt); it uses Android's `UsageStatsManager` and opens system Usage Access settings when the user selects the permission action.

The data is used for the Home screen's usage summaries. Access is optional and user-granted. This native implementation is Android-specific; other platforms do not provide this channel and should not be expected to show these statistics.

## Source layout

Within `frontend/app/lib`, the main areas are:

- `main.dart`, `app_page.dart`, and `app_bar.dart`: app startup, main shell/navigation, and shared app bar.
- `core/`: shared constants such as colors and service endpoints.
- `features/`: feature-specific screens and widgets for authentication, Home, History, and Profile.
- `providers/`: Provider-based authentication and user state.
- `services/`: database-facing operations, authentication calls, and device usage processing.
- `models/`: Drift table definitions.
- `database/`: database setup and shared database access.
- `utils/`: shared helpers, including password hashing.

The `assets/images/` and `google_fonts/` directories are registered in [pubspec.yaml](frontend/app/pubspec.yaml). The logo is used by the splash screen and the launcher/splash configuration. Lint settings are in [analysis_options.yaml](frontend/app/analysis_options.yaml).

## Dependencies and tests

The package dependencies include Flutter, Provider, Drift, `drift_flutter`, `path_provider`, `path`, Shared Preferences, Flutter Secure Storage, bcrypt, HTTP, UUID, `intl`, and Google Fonts. Drift's generator and `build_runner` are development dependencies, alongside Flutter test and lint tooling. The dependency declarations and asset configuration are in [pubspec.yaml](frontend/app/pubspec.yaml).

The current widget test is [widget_test.dart](frontend/app/test/widget_test.dart). It exercises the invalid sign-in input feedback. Its expected snackbar text currently differs from the string emitted by the login form, so this test may need updating before it can pass reliably.

To run the frontend's checks from `frontend/app`, use `flutter analyze` for static analysis and `flutter test` for the test suite. Flutter widget tests can run without a physical device, while usage-stat behavior requires a compatible Android device or emulator and its system permission.

## Current limitations to keep in mind

- Appointment management, medical-history search/download, profile sharing/language actions, and biometric authentication are not implemented as full features.
- The active authentication path is local-first despite the presence of HTTP auth methods. Server registration and local sign-in are not yet a fully integrated flow.
- Session restoration is not currently wired into startup, and the user data provider's user UUID lifecycle should be reviewed when integrating login state changes.
- Hydration persistence is not associated with a calendar day, so the saved amount can carry over between days.
- The Android usage summary requires explicit system permission and is unavailable through the current native implementation on other platforms.
