// ignore_for_file: implementation_imports

import 'dart:io';
import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Gateway {
  Gateway({
    required this.httpClient,
  });

  Future<String> getToken() async {
    return await LocalStorageService.instance.get(key: LocalStorageKey.token);
  }

  final http.Client httpClient;
  final baseApiUrl = 'https://api.industriadechocolatesamor.com.br/';
  final timeout = const Duration(milliseconds: 5000);
  Future<Map<String, String>> requestOptions() async {
    final token = await getToken();
    final headers = {
      HttpHeaders.authorizationHeader: "Bearer $token",
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  Future<T> request<T>(
    String url,
    T Function(dynamic) fromJson, {
    data = const {},
    HTTPMethod method = HTTPMethod.get,
    Function(Exception)? onError,
  }) async {
    debugPrint('Fetching $url from API');
    debugPrint('${method.toString().toUpperCase()} $url');
    debugPrint(data.toString());

    try {
      late Response response;
      switch (method) {
        case HTTPMethod.get:
          response = await _get(url);
          break;
        case HTTPMethod.post:
          response = await _post(url, data);
          break;
        case HTTPMethod.put:
          response = await _put(url, data);
          break;
        case HTTPMethod.delete:
          response = await _delete(url, data);
          break;
      }
      return fromJson(response.body);
    } on Exception catch (e) {
      debugPrint('Failed fetching $url from API -> ${e.toString()}');

      if (onError != null) {
        return onError(e);
      }
      rethrow;
    }
  }

  Future<Response> _get(String url) async {
    final response = await httpClient
        .get(
          Uri.parse('$baseApiUrl/$url'),
          headers: await requestOptions(),
        )
        .timeout(timeout);
    return response;
  }

  Future<Response> _post(
    String url,
    data,
  ) async {
    final response = await httpClient
        .post(
          Uri.parse('$baseApiUrl/$url'),
          headers: await requestOptions(),
          body: data,
        )
        .timeout(timeout);
    return response;
  }

  Future<Response> _put(
    String url,
    data,
  ) async {
    final response = await httpClient
        .put(
          Uri.parse('$baseApiUrl/$url'),
          headers: await requestOptions(),
          body: data,
        )
        .timeout(timeout);
    return response;
  }

  Future<Response> _delete(
    String url,
    data,
  ) async {
    final response = await httpClient
        .delete(
          Uri.parse('$baseApiUrl/$url'),
          headers: await requestOptions(),
          body: data,
        )
        .timeout(timeout);
    return response;
  }
}

enum HTTPMethod { get, post, delete, put }
