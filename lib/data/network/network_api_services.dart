import 'dart:convert';
import 'package:farmkal/data/app_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices {
  Future<dynamic> postDataWithToken(var data, String token, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'content-Type': 'application/json',
    };
    dynamic responseData;
    try {
      final response = await http
          .post(Uri.parse(url), headers: requestHeaders, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));

      responseData = returnResponse(response);
    } catch (e) {
      print("An error occurred: $e");
    }
    print(responseData.toString());
    return responseData;
  }

  Future<String> sendMessageWithToken(
      var data, String token, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'content-Type': 'application/json',
    };
    try {
      final response = await http
          .post(Uri.parse(url), headers: requestHeaders, body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to send message.');
      }
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException;
      case 500:
        throw ServerException;
      default:
        throw FetchDataException(
            'Error occurred while Communication with server' +
                response.statusCode.toString());
    }
  }
}

class ChatService {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<dynamic> chatListData(var data, String token, String url) async {
    dynamic response =
        await _networkApiServices.postDataWithToken(data, token, url);

    print(response);
    return response;
  }

  Future<dynamic> chatData(var data, String token, String url) async {
    dynamic response =
        await _networkApiServices.postDataWithToken(data, token, url);

    print(response);
    return response;
  }

  Future<void> sendMessage(String message, String token, String url) async {
    final response = await _networkApiServices.sendMessageWithToken(
      {'message': message},
      token,
      url,
    );

    if (response != null) {
      print(jsonDecode(response));
    } else {
      throw Exception('Failed to send message.');
    }
  }
}
