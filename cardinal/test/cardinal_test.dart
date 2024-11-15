import 'package:cardinal/cardinal.dart';
import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCardinalPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements CardinalPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Cardinal', () {
    late CardinalPlatform cardinalPlatform;

    setUp(() {
      cardinalPlatform = MockCardinalPlatform();
      CardinalPlatform.instance = cardinalPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => cardinalPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => cardinalPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
