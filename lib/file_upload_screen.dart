import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  FileUploadScreenState createState() => FileUploadScreenState();
}

class FileUploadScreenState extends State<FileUploadScreen> {
  File? _file;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_file == null) return;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://your-api-endpoint.com/upload'),
    );
    request.files.add(await http.MultipartFile.fromPath('file', _file!.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      debugPrint('File uploaded successfully');
    } else {
      debugPrint('File upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: const Text('Pick File'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadFile,
              child: const Text('Upload File'),
            ),
          ],
        ),
      ),
    );
  }
}
