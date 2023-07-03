import 'package:flutter_test/flutter_test.dart';
import 'package:chunk/chunk.dart';
import 'package:chunk/chunk_platform_interface.dart';
import 'package:chunk/chunk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockChunkPlatform
    with MockPlatformInterfaceMixin
    implements ChunkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ChunkPlatform initialPlatform = ChunkPlatform.instance;

  test('$MethodChannelChunk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelChunk>());
  });

  test('getPlatformVersion', () async {
    Chunk chunkPlugin = Chunk();
    MockChunkPlatform fakePlatform = MockChunkPlatform();
    ChunkPlatform.instance = fakePlatform;

    expect(await chunkPlugin.getPlatformVersion(), '42');
  });
}
