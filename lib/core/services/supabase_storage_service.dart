import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:fruit_hub/core/services/storage_servive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/app_key.dart';

class SupabaseStorageService implements StorageServive {
  static late Supabase supabase;

  static createBucket(String bucketName) async {
    var buckets = await supabase.client.storage.listBuckets();
    bool bucketExists = false;
    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        bucketExists = true;
        break;
      }
    }
    if (!bucketExists) {
      await supabase.client.storage.createBucket(bucketName);
    }
  }

  static initializeSupabase() async {
    supabase = await Supabase.initialize(
      url: ksupabaseUrl,
      anonKey: ksupabaseKey,
    );
  }

  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String extansion = p.extension(fileName);
    await supabase.client.storage
        .from('user_image')
        .upload('$path/$fileName.$extansion', file);

    final String publicUrl = supabase.client.storage
        .from('user_image')
        .getPublicUrl('$path/$fileName.$extansion');

    return publicUrl;
  }
}
