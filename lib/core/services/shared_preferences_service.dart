import 'dart:convert';
import 'package:docdoc/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUser(AuthEntity user) async {
    await _prefs?.setString('user', jsonEncode(user.toJson()));
  }

  static AuthEntity? getUser() {
    final user = _prefs?.getString('user');
    return user != null ? AuthEntity.fromJson(jsonDecode(user)) : null;
  }

  static Future<void> clearUserData() async {
    await _prefs?.remove('user');
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static Future<void> setToken(String token) async {
    var storge = FlutterSecureStorage();
    await storge.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    var storge = FlutterSecureStorage();
    return await storge.read(key: 'token');
  }

  static Future<void> clearToken() async {
    var storge = FlutterSecureStorage();
    await storge.delete(key: 'token');
  }
}
