import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:duraspeed_checker/duraspeed_checker_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDuraspeedChecker platform = MethodChannelDuraspeedChecker();
  const MethodChannel channel = MethodChannel('duraspeed_checker');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getPlatformVersion':
          return '42';
        case 'checkDuraSpeed':
          return true;
        case 'isDuraSpeedEnabled':
          return true; // Mock as enabled
        default:
          throw PlatformException(code: 'UNIMPLEMENTED');
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('checkDuraSpeed', () async {
    expect(await platform.checkDuraSpeed(), true);
  });

  test('isDuraSpeedEnabled', () async {
    expect(await platform.isDuraSpeedEnabled(), true);
  });
}