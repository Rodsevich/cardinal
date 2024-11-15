import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [CardinalPlatform].
class CardinalIOS extends CardinalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cardinal_ios');

  /// Registers this class as the default instance of [CardinalPlatform]
  static void registerWith() {
    CardinalPlatform.instance = CardinalIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
