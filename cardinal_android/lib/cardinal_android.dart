import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The Android implementation of [CardinalPlatform].
//TODO(Jei): implementar metodos
class CardinalAndroid extends CardinalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cardinal_android');

  /// Registers this class as the default instance of [CardinalPlatform]
  static void registerWith() {
    CardinalPlatform.instance = CardinalAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
