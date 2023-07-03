import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'chunk_method_channel.dart';

abstract class ChunkPlatform extends PlatformInterface {
  /// Constructs a ChunkPlatform.
  ChunkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ChunkPlatform _instance = MethodChannelChunk();

  /// The default instance of [ChunkPlatform] to use.
  ///
  /// Defaults to [MethodChannelChunk].
  static ChunkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ChunkPlatform] when
  /// they register themselves.
  static set instance(ChunkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
