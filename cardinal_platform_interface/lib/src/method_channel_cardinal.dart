import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

/// An implementation of [CardinalPlatform] that uses method channels.
class MethodChannelCardinal extends CardinalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cardinal');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }

  @override
  Future<String?> getDeviceFingerprint() {
    return methodChannel.invokeMethod<String>('getDeviceFingerprint');
  }
}
