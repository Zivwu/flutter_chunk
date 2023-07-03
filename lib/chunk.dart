
import 'chunk_platform_interface.dart';

class Chunk {
  Future<String?> getPlatformVersion() {
    return ChunkPlatform.instance.getPlatformVersion();
  }
}
