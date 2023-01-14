import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'network_enums.dart';
import 'network_typedef.dart';

abstract class NetworkHelper {
  static String buildUrl(String relativeUrl) {
    return '${Config.host}/${Config.version}/$relativeUrl';
  }

  static String concatUrlParameters(
      {required String url, required Map<String, dynamic>? queryParameters}) {
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    url += '?';

    queryParameters.forEach((key, value) {
      url += '$key=$value&';
    });
    url = url.substring(0, url.length - 1);
    return url;
  }

  static R checkResponse<R>({
    required http.Response? response,
    required NetworkCallBack<R> onSuccess,
    required NetworkOnFailureCallBackWithMessage<R> onFailure,
  }) {
    Map<String, dynamic> responseMap = jsonDecode(response!.body);
    debugPrint('Raw Response : $responseMap');
    try {
      if (response.body.isEmpty) {
        return onFailure(responseMap,NetworkErrorResponseType.emptyResponse,
            'Response is Null or Empty');
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          debugPrint('Response in 200 & 201 case : ${response.body}');
          if (responseMap['status'] == '1') {
            return onSuccess(responseMap);
          } else {
            return onFailure(responseMap,NetworkErrorResponseType.didNotSucceed,
                responseMap['message'] ?? 'Some Error occurred');
          }
        case 400:
          return onFailure(responseMap,NetworkErrorResponseType.badRequest,
              responseMap['message'] ?? 'Some Error occurred');

        case 1708:
          return onFailure(responseMap,
              NetworkErrorResponseType.socket, 'Socket Exception occurred');
        default:
          return onFailure(responseMap,
              NetworkErrorResponseType.didNotSucceed, 'Some Error occurred');
      }
    } catch (e) {
      debugPrint('Error occured in API checkResponse : $e');
      return onFailure(responseMap,
          NetworkErrorResponseType.didNotSucceed, 'Some Error occurred');
    }
  }
}
