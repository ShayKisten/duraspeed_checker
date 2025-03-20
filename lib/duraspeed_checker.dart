import 'dart:io' show Platform;
import 'duraspeed_checker_platform_interface.dart';

class DuraspeedChecker {
  /// Returns the Android platform version.
  /// Returns `null` if not running on Android.
  Future<String?> getPlatformVersion() {
    if (!Platform.isAndroid) {
      return Future.value(null);
    }
    return DuraspeedCheckerPlatform.instance.getPlatformVersion();
  }

  /// Checks if DuraSpeed exists on the device by looking for packages containing "duraspeed".
  /// Returns `false` if not running on Android or if DuraSpeed is not detected.
  Future<bool?> checkDuraSpeed() {
    if (!Platform.isAndroid) {
      return Future.value(false);
    }
    return DuraspeedCheckerPlatform.instance.checkDuraSpeed();
  }

  /// Checks if DuraSpeed is currently enabled (active) on the device.
  /// Returns `false` if not running on Android or if DuraSpeed is not active/present.
  Future<bool?> isDuraSpeedEnabled() {
    if (!Platform.isAndroid) {
      return Future.value(false);
    }
    return DuraspeedCheckerPlatform.instance.isDuraSpeedEnabled();
  }
}