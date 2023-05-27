import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// {@template cache_client}
/// An in-memory cache client.
/// {@endtemplate}
class CacheClient {
  /// {@macro cache_client}
  CacheClient() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  /// Writes the provide [key], [value] pair to the in-memory cache.
  void writeSP(
      {required String key,
      required String value,
      required SharedPreferences prefs}) async {
    prefs.setString(key, value);
  }

  String? readSp({required String key, required SharedPreferences prefs}) {
    return prefs.getString(key);
  }
}
