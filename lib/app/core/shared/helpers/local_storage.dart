import 'package:appweb/app/core/interfaces/local_storage_interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService implements LocalStorage {
  LocalStorageService._() {
    initializeIfNeeded();
  }

  static LocalStorage? _instance;

  static LocalStorage get instance => _instance ??= LocalStorageService._();

  SharedPreferences? _storage;

  Future<void> initializeIfNeeded() async {
    if (_storage == null) {
      debugPrint('Initializing storage');
      _storage = await SharedPreferences.getInstance();
    }
  }

  @override
  Future delete({required String key}) async {
    await initializeIfNeeded();
    _storage?.remove(key);
  }

  @override
  Future get({required String key, dynamic defaultValue}) async {
    await initializeIfNeeded();
    final result = _storage?.get(key) ?? defaultValue;
    debugPrint('LocalStorageService: GET $key: $result');
    return _storage?.get(key) ?? defaultValue;
  }

  @override
  Future saveItem({required String key, required dynamic value}) async {
    await initializeIfNeeded();
    debugPrint('LocalStorageService: SaveItem $key: $value');
    if (value is bool) {
      await _storage?.setBool(key, value);
    } else if (value is String) {
      await _storage?.setString(key, value);
    }
    if (value is int) {
      await _storage?.setInt(key, value);
    }
    if (value is double) {
      await _storage?.setDouble(key, value);
    } else {
      await _storage?.setString(key, value.toString());
    }
  }
}
