import 'dart:io';

abstract class StorageServive {
  Future<String> uploadFile({required File file, required String path});
}
