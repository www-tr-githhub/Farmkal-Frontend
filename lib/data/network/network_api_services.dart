//This is the main file. whichever api is to be called is handled using this file
import 'dart:convert';
//import 'dart:html';
import 'dart:io';

import 'package:farmkal/data/app_exceptions.dart';
import 'package:farmkal/data/network/base_api_sevices.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  //will be used in future  here in getapi we will get the data
  //we will pass the url here
  @override
  Future<dynamic> getApi(String url) async {
    //using await so async
    //while debuging we want to see thye url
    //to check the url is corrctv we print it
    if (kDebugMode) {
      print(url);
    }
    Map<String, String> requestHeaders = {
      // 'Authorization': 'Bearer $token',
      'content-Type': 'application/json',
    };
    //Json can have any model
    dynamic responseJson;
    //we use try because we know error may occur to handl the exception we use it
    try {
      //response of the api will be stored & converting string url to uri using uri.parse
      final response = await http
          .get(Uri.parse(url), headers: requestHeaders)
          .timeout(const Duration(seconds: 10));
      //store the valuse
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getApiwithtoken(
      String url, String token, String roomId) async {
    //using await so async
    //while debuging we want to see thye url
    //to check the url is corrctv we print it
    if (kDebugMode) {
      print(url);
    }
    Map<String, String> requestHeaders = {
      'Authorization': 'Bearer $token',
      'content-Type': 'application/json',
    };
    //Json can have any model
    dynamic responseJson;
    //we use try because we know error may occur to handl the exception we use it
    try {
      //response of the api will be stored & converting string url to uri using uri.parse
      final response = await http
          .get(Uri.parse(roomId.isEmpty ? url : url + roomId),
              headers: requestHeaders)
          .timeout(const Duration(seconds: 10));
      //store the valuse
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

//datas are matched
  @override
  Future<dynamic> postApi(var data, String url) async {
    if (kDebugMode) {
      print(data);
      print(url);
    }
    Map<String, String> requestHeaders = {
      // 'Authorization': 'Bearer $token',
      'content-Type': 'application/json',
    };
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data), headers: requestHeaders)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  Future<dynamic> postDatawithtoken(data, String token, String url) async {
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
            'Error occured while Communication with server' +
                response.statusCode.toString());
    }
  }
}
