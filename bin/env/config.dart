import 'package:envied/envied.dart';

part 'config.g.dart';

@Envied()
abstract class Config {
  @EnviedField(
    varName: 'API_KEY',
    obfuscate: true,
  )
  static final String apiKey = _Config.apiKey;
}
