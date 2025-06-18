import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static SharedPreferences? _prefs;

  // Initialize the service (must be called before usage)
  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Generic Setters
  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  // Generic Getters
  static String? getString(String key) => _prefs?.getString(key);
  static bool? getBool(String key) => _prefs?.getBool(key);
  static int? getInt(String key) => _prefs?.getInt(key);
  static double? getDouble(String key) => _prefs?.getDouble(key);
  static List<String>? getStringList(String key) => _prefs?.getStringList(key);

  // Utility
  static Future<bool> containsKey(String key) async {
    return _prefs?.containsKey(key) ?? false;
  }

  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  static Future<void> clear() async {
    await _prefs?.clear();
  }
}

const String kOnboardingSeen = 'kOnboardingSeen';
