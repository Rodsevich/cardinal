import 'package:cardinal_platform_interface/cardinal_platform_interface.dart';

CardinalPlatform get _platform => CardinalPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
