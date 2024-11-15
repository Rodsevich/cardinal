import 'package:cardinal_ios/cardinal_ios.dart';
import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CardinalIOS', () {
    const kPlatformName = 'iOS';
    late CardinalIOS cardinal;
    late List<MethodCall> log;

    setUp(() async {
      cardinal = CardinalIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(cardinal.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      CardinalIOS.registerWith();
      expect(CardinalPlatform.instance, isA<CardinalIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await cardinal.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
