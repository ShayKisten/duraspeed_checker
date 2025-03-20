# DuraSpeed Checker

A Flutter plugin for Android to detect the presence and status of DuraSpeed, a battery optimization feature on some MediaTek-based devices (e.g., Oppo, Vivo, Tecno).

## Features

*   Checks if DuraSpeed exists on the device.
*   Attempts to detect if DuraSpeed is active (based on running services).
*   Retrieves the Android OS version.

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  duraspeed_checker: ^0.1.0
```
Run ```flutter pub get```.

## Usage

```dart
import 'package:duraspeed_checker/duraspeed_checker.dart';

void checkDuraSpeed() async {
  final checker = DuraspeedChecker();

  // Get Android version
  final version = await checker.getPlatformVersion();
  print("Version: $version"); // "Android 13" or null if not Android

  // Check if DuraSpeed exists
  final exists = await checker.checkDuraSpeed();
  print("Exists: $exists"); // true if found, false if not or not Android

  // Check if DuraSpeed is enabled
  final enabled = await checker.isDuraSpeedEnabled();
  print("Enabled: $enabled"); // true if active, false if not or not Android
}
```

## Limitations

* Android-only, returns safe defaults (null or false) on other platforms.
* ```isDuraSpeedEnabled``` may be inconsistent due to varying DuraSpeed implementations.
 
 