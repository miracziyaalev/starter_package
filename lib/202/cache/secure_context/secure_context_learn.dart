import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedContextLearn extends StatefulWidget {
  const SharedContextLearn({super.key});

  @override
  State<SharedContextLearn> createState() => _SharedContextLearnState();
}

enum _SecureKeys { token }

class _SharedContextLearnState extends State<SharedContextLearn> {
  final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  String _title = '';

  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    getSecureItems();
    super.initState();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        child: const Text('save'),
      ),
      body: TextField(
        onChanged: saveItems,
      ),
    );
  }
}

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );
