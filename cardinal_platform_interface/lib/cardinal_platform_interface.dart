import 'package:cardinal_platform_interface/src/method_channel_cardinal.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of cardinal must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `Cardinal`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [CardinalPlatform] methods.
abstract class CardinalPlatform extends PlatformInterface {
  /// Constructs a CardinalPlatform.
  CardinalPlatform() : super(token: _token);

  static final Object _token = Object();

  static CardinalPlatform _instance = MethodChannelCardinal();

  /// The default instance of [CardinalPlatform] to use.
  ///
  /// Defaults to [MethodChannelCardinal].
  static CardinalPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [CardinalPlatform] when they register themselves.
  static set instance(CardinalPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
