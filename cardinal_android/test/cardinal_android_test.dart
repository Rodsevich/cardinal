import 'package:cardinal_android/cardinal_android.dart';
import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CardinalAndroid', () {
    const kPlatformName = 'Android';
    late CardinalAndroid cardinal;
    late List<MethodCall> log;

    setUp(() async {
      cardinal = CardinalAndroid();

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
      CardinalAndroid.registerWith();
      expect(CardinalPlatform.instance, isA<CardinalAndroid>());
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
