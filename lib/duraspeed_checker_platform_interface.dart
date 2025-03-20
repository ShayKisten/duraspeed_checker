import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'duraspeed_checker_method_channel.dart';

abstract class DuraspeedCheckerPlatform extends PlatformInterface {
  DuraspeedCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static DuraspeedCheckerPlatform _instance = MethodChannelDuraspeedChecker();

  static DuraspeedCheckerPlatform get instance => _instance;

  static set instance(DuraspeedCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();
  Future<bool?> checkDuraSpeed();
  Future<bool?> isDuraSpeedEnabled();
}