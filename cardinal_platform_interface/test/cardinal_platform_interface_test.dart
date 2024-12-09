// import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
// import 'package:flutter_test/flutter_test.dart';

// class CardinalMock extends CardinalPlatform {
//   static const mockPlatformName = 'Mock';

//   @override
//   Future<String?> getPlatformName() async => mockPlatformName;
// }

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   group('CardinalPlatformInterface', () {
//     late CardinalPlatform cardinalPlatform;

//     setUp(() {
//       cardinalPlatform = CardinalMock();
//       CardinalPlatform.instance = cardinalPlatform;
//     });

//     group('getPlatformName', () {
//       test('returns correct name', () async {
//         expect(
//           await CardinalPlatform.instance.getPlatformName(),
//           equals(CardinalMock.mockPlatformName),
//         );
//       });
//     });
//   });
// }
