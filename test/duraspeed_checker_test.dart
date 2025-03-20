import 'package:flutter_test/flutter_test.dart';
import 'package:duraspeed_checker/duraspeed_checker.dart';
import 'package:duraspeed_checker/duraspeed_checker_platform_interface.dart';
import 'package:duraspeed_checker/duraspeed_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDuraspeedCheckerPlatform
    with MockPlatformInterfaceMixin
    implements DuraspeedCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> checkDuraSpeed() => Future.value(true);

  @override
  Future<bool?> isDuraSpeedEnabled() => Future.value(true); // Mock as enabled
}

void main() {
  final DuraspeedCheckerPlatform initialPlatform = DuraspeedCheckerPlatform.instance;

  test('$MethodChannelDuraspeedChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDuraspeedChecker>());
  });

  test('getPlatformVersion', () async {
    DuraspeedChecker duraspeedCheckerPlugin = DuraspeedChecker();
    MockDuraspeedCheckerPlatform fakePlatform = MockDuraspeedCheckerPlatform();
    DuraspeedCheckerPlatform.instance = fakePlatform;

    expect(await duraspeedCheckerPlugin.getPlatformVersion(), '42');
  });

  test('checkDuraSpeed', () async {
    DuraspeedChecker duraspeedCheckerPlugin = DuraspeedChecker();
    MockDuraspeedCheckerPlatform fakePlatform = MockDuraspeedCheckerPlatform();
    DuraspeedCheckerPlatform.instance = fakePlatform;

    expect(await duraspeedCheckerPlugin.checkDuraSpeed(), true);
  });

  test('isDuraSpeedEnabled', () async {
    DuraspeedChecker duraspeedCheckerPlugin = DuraspeedChecker();
    MockDuraspeedCheckerPlatform fakePlatform = MockDuraspeedCheckerPlatform();
    DuraspeedCheckerPlatform.instance = fakePlatform;

    expect(await duraspeedCheckerPlugin.isDuraSpeedEnabled(), true);
  });
}