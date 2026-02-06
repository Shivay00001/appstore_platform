import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/storage_service.dart';

class UploadScreen extends ConsumerStatefulWidget {
  const UploadScreen({super.key});

  @override
  ConsumerState<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends ConsumerState<UploadScreen> {
  File? _selectedFile;
  bool _isUploading = false;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _upload() async {
    if (_selectedFile == null) return;
    setState(() => _isUploading = true);
    
    final url = await ref.read(storageServiceProvider).uploadFile(_selectedFile!);
    
    if (mounted) {
      setState(() => _isUploading = false);
      if (url != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Uploaded successfully: $url')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Your App')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'App Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_upload, size: 48),
                    const SizedBox(height: 8),
                    Text(_selectedFile?.path.split('\\').last ?? 'Click to select APK, EXE, or ZIP'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            if (_isUploading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _selectedFile != null ? _upload : null,
                child: const Text('Publish App'),
              ),
          ],
        ),
      ),
    );
  }
}
