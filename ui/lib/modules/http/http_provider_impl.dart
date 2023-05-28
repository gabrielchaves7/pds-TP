// ignore_for_file: strict_raw_type

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:premium_todo/modules/http/constants.dart';
import 'package:premium_todo/modules/http/http_extensions.dart';
import 'package:premium_todo/modules/http/http_provider.dart';

class HttpProvider implements IHttpProvider {
  HttpProvider();

  Map<String, dynamic> _parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> parseJson(String text) {
    return compute(_parseAndDecode, text);
  }

  Uri _getUri(String path) {
    return Uri.http(Constants.apiBaseUrl, path);
  }

  void _validateResponse(http.Response response) {
    if (!response.ok) {
      throw Exception(response.body);
    }
  }

  final _headers = {HttpHeaders.contentTypeHeader: 'application/json'};

  @override
  Future<http.Response> post(
    String path, {
    dynamic body,
  }) async {
    final response = await http.post(
      _getUri(path),
      body: jsonEncode(body),
      headers: _headers,
    );
    _validateResponse(response);

    return response;
  }

  @override
  Future<http.Response> get(String path) async {
    final response = await http.get(
      _getUri(path),
      headers: _headers,
    );
    _validateResponse(response);

    return response;
  }
}
