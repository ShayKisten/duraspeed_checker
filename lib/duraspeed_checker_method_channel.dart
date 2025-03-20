import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'duraspeed_checker_platform_interface.dart';

class MethodChannelDuraspeedChecker extends DuraspeedCheckerPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('duraspeed_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> checkDuraSpeed() async {
    final hasDuraSpeed = await methodChannel.invokeMethod<bool>('checkDuraSpeed');
    return hasDuraSpeed;
  }

  @override
  Future<bool?> isDuraSpeedEnabled() async {
    final isEnabled = await methodChannel.invokeMethod<bool>('isDuraSpeedEnabled');
    return isEnabled;
  }
}