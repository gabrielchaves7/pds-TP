import 'dart:async';
import 'dart:convert';

import 'package:cache/cache.dart';
import 'package:premium_todo/bootstrap.dart';
import 'package:premium_todo/modules/http/http_provider.dart';
import 'package:premium_todo/modules/sign_up/repository/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpRepository {
  SignUpRepository({
    IHttpProvider? http,
    CacheClient? cache,
  }) : _cache = cache ?? CacheClient() {
    this.http = http ?? getIt<IHttpProvider>();
  }

  late IHttpProvider http;
  final CacheClient _cache;

  final StreamController<NUser> _userStreamController =
      StreamController<NUser>();
  Stream<NUser> get userStream => _userStreamController.stream;

  static const userCacheKey = '__user_cache_key__';

  /// Returns the current cached user.
  NUser get currentUser {
    final json = _cache.readSp(
      key: userCacheKey,
      prefs: getIt<SharedPreferences>(),
    );
    if (json != null) {
      return NUser.fromJson(jsonDecode(json) as Map<String, dynamic>);
    }

    return NUser.empty;
  }

  Future<void> post({
    required String username,
    required String password,
    required String role,
  }) async {
    try {
      final response = await http.post(
        '/api/auth/signup',
        body: {
          'username': username,
          'password': password,
          'role': role,
        },
      );

      final user = NUser.fromJson(
        jsonDecode(response.body)['user'] as Map<String, dynamic>,
      );

      _cache.writeSP(
        key: userCacheKey,
        value: jsonEncode(user.toJson()),
        prefs: getIt<SharedPreferences>(),
      );
      _userStreamController.add(user);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final response = await http.post(
        '/api/auth/login',
        body: {
          'username': username,
          'password': password,
        },
      );

      final user = NUser.fromJson(
        jsonDecode(response.body)['user'] as Map<String, dynamic>,
      );

      _cache.writeSP(
        key: userCacheKey,
        value: jsonEncode(user.toJson()),
        prefs: getIt<SharedPreferences>(),
      );
      _userStreamController.add(user);
    } catch (e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    const user = NUser.empty;
    _cache.writeSP(
      prefs: getIt<SharedPreferences>(),
      key: userCacheKey,
      value: jsonEncode(
        user.toJson(),
      ),
    );
    _userStreamController.add(user);
  }
}
