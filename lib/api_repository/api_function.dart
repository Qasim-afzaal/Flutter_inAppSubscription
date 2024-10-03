import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_inappsubscriptions/api_repository/api_class.dart';
import 'package:flutter_inappsubscriptions/core/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../core/constants/imports.dart';

class APIFunction {
  Future<dynamic> apiCall({
    required String apiName,
    Object? withOutFormData,
    String? token = "",
    bool isGet = false,
    bool isLoading = true,
  }) async {
    utils.hideKeyboard();
    try {
      var response;
      if (isGet) {
        response = await HttpUtil(token!, isLoading, Get.context!)
            .get(apiName)
            .timeout(const Duration(seconds: 30));
      } else {
        response = await HttpUtil(token!, isLoading, Get.context!)
            .post(
              apiName,
              withOutFormData: withOutFormData,
            )
            .timeout(const Duration(seconds: 30));
      }
      return response.data;
    } catch (e) {
      print("API Call Error: $e");
      // Return a default value or error message
      return {"error": "An error occurred during the API call."};
    }
  }

  Future<dynamic> patchApiCall({
    required String apiName,
    FormData? data,
    Object? withOutFormData,
    String? token = "",
    bool isLoading = true,
  }) async {
    utils.hideKeyboard();
    try {
      var response = await HttpUtil(token!, isLoading, Get.context!)
          .patch(
            apiName,
            data: data,
            withOutFormData: withOutFormData,
          )
          .timeout(const Duration(seconds: 120));
      return response.data;
    } catch (e) {
      print("Patch API Call Error: $e");
      // Return a default value or error message
      return {"error": "An error occurred during the PATCH API call."};
    }
  }

   Future<dynamic> sendPostRequest(
    dynamic requestData,
    String port,
    String url,
    String? authToken,
  ) async {
    String apiUrl = Constants.baseUrl + port + url;

    try {
      http.Response response = await http
          .post(
            Uri.parse(apiUrl),
            headers: authToken != null
                ? {
                    HttpHeaders.contentTypeHeader: 'application/json',
                    HttpHeaders.authorizationHeader: "Bearer $authToken"
                  }
                : {HttpHeaders.contentTypeHeader: 'application/json'},
            body: json.encode(requestData),
          )
          .timeout(const Duration(seconds: 30));

      return json.decode(response.body);
    } on TimeoutException {
      return {
        "statusCode": 500,
        "message": "Request Timeout",
      };
    } catch (error) {
      return {
        "statusCode": 400,
        "message": "No internet connection",
      };
    }
  }

  Future<dynamic> deleteApiCall({
    required String apiName,
    Object? withOutFormData,
    String? token = "",
    bool isLoading = true,
  }) async {
    utils.hideKeyboard();
    try {
      var response = await HttpUtil(token!, isLoading, Get.context!)
          .delete(apiName)
          .timeout(const Duration(seconds: 30));
      return response.data;
    } catch (e) {
      print("Delete API Call Error: $e");
      // Return a default value or error message
      return {"error": "An error occurred during the DELETE API call."};
    }
  }
}
