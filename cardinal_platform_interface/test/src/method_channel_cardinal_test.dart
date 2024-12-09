// import 'package:cardinal_platform_interface/src/method_channel_cardinal.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();
//   const kPlatformName = 'platformName';

//   group('$MethodChannelCardinal', () {
//     late MethodChannelCardinal methodChannelCardinal;
//     final log = <MethodCall>[];

//     setUp(() async {
//       methodChannelCardinal = MethodChannelCardinal();
//       TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
//           .setMockMethodCallHandler(
//         methodChannelCardinal.methodChannel,
//         (methodCall) async {
//           log.add(methodCall);
//           switch (methodCall.method) {
//             case 'getPlatformName':
//               return kPlatformName;
//             default:
//               return null;
//           }
//         },
//       );
//     });

//     tearDown(log.clear);

//     test('getPlatformName', () async {
//       final platformName = await methodChannelCardinal.getPlatformName();
//       expect(
//         log,
//         <Matcher>[isMethodCall('getPlatformName', arguments: null)],
//       );
//       expect(platformName, equals(kPlatformName));
//     });
//   });
// }
