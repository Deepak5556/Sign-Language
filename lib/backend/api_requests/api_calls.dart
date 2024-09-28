import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Auth Group Code

class AuthGroup {
  static String getBaseUrl() => 'https://dev-v800atg6owf6mobs.us.auth0.com';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '$baseUrl/oauth/token',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'grant_type': "password",
        'client_id': "T8DwAMSJgekP0SlcrDPPG6jFCFPOJ1eQ",
        'username': username,
        'password': password,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Auth Group Code

/// Start Sign Group Code

class SignGroup {
  static String getBaseUrl() => 'http://13.61.25.112:8000/predict';
  static Map<String, String> headers = {};
}

/// End Sign Group Code

/// Start Pridict Group Code

class PridictGroup {
  static String getBaseUrl() => 'http://13.61.25.112:8000';
  static Map<String, String> headers = {
    'Content-Type': 'multipart/form-data',
  };
  static PredictionCall predictionCall = PredictionCall();
}

class PredictionCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    final baseUrl = PridictGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'prediction',
      apiUrl: '$baseUrl/predict',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Content-Type': 'multipart/form-data',
      },
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Pridict Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
