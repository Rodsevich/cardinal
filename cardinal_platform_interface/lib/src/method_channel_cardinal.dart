import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';

/// An implementation of [CardinalPlatform] that uses method channels.
//TODO(Nico): hacer abstract y agnostizar
class MethodChannelCardinal extends CardinalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cardinal');

  @override
  //TODO(Jei): definir bien los argumentos
  Future<bool?> setUp(String token, int sarasa) {
    return methodChannel
        .invokeMethod<bool>('setUp', {'token': token, 'sarasa': sarasa});
  }

  @override
  //TODO(Jei): definir bien los argumentos
  Future<String?> launchChallenge(String tokenGentrx, String incognita2) {
    return methodChannel.invokeMethod<String>(
        'setUp', {'tokenGentrx': tokenGentrx, 'incognita2': incognita2});
  }
}
