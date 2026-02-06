import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StorageService {
  Future<String?> uploadFile(File file);
}

class MockStorageService implements StorageService {
  @override
  Future<String?> uploadFile(File file) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'https://mock-storage.com/${file.path.split('/').last}';
  }
}

final storageServiceProvider = Provider<StorageService>((ref) => MockStorageService());
