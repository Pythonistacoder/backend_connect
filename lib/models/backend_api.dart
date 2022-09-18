import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../utils/status_code.dart';
import '../response/models/abstract/api_response_model.dart';
import '../utils/http_verbs.dart';

import '../response/models/implementation/error_model.dart';
import '../response/models/implementation/response_model.dart';
import 'response_by_status.dart';

class BackendAPI {
  final String endpoint;
  final String baseUrl;
  final String httpVerb;
  final Map<String, String>? extraHeaders;
  String bodyFormat;
  String headerFormat;
  final ResponseByStatus responseByStatus;

  Map<String, String> headers;

  BackendAPI({
    this.extraHeaders,
    required this.endpoint,
    required this.baseUrl,
    required this.httpVerb,
    required this.bodyFormat,
    required this.headerFormat,
    required this.responseByStatus,
  }) : headers = extraHeaders != null
            ? {
                ...extraHeaders,
                ...{"Content-Type": "application/json"}
              }
            : {"Content-Type": "application/json"};

  /// Before sending the data see the format of headers and body
  ///
  /// If the header contains Authorization:token then token need to be passed
  ///
  /// It is used to test different possible combination of reponse
  Future<Map<String, dynamic>> getData({
    Map<String, dynamic>? data,
    String? id,
    String? token,
  }) {
    if (token != null) {
      headers["Authorization"] = token;
    }

    return HttpVerb()
        .getResponse(
            body: json.encode(data),
            url: "$baseUrl/$endpoint${id != null ? "/$id" : ""}",
            headers: headers,
            httpVerb: httpVerb)
        .then((response) {
      if (response != null) {
        return {
          "body": json.decode(response.body),
          "statusCode": response.statusCode
        };
      } else {
        return {"body": null, "statusCode": null};
      }
    }).catchError(
      (error) {
        throw Exception("Kindly check your internet connection");
      },
      test: (e) => e is SocketException,
    ).catchError(
      (error) {
        throw Exception(
            """Kindly check your endpoint(by printing), body or http verb. 
            Also check whether the response is null""");
      },
      test: (e) => e is FormatException,
    ).catchError((error) {
      throw Exception("Kindly check your internet connection");
    });
  }

  String? resultByStatusCode({required http.Response response}) {
    switch (response.statusCode) {
      case 404:
        throw Exception("""The page/url you are trying to exist doesnt exist. 
            Kindly check your endpoint(by printing), body or http verb""");
      case 500:
        throw Exception("Internal server error.Kindly check in postman");
      case 201:
        return response.body;
      case 401:
        throw Exception("BAD REQUEST error. Kindly check if token is required");
      case 200:
        return response.body;
      default:
        return null;
    }
  }

  Future<ApiResponseModel?> getResponse({
    Map<String, dynamic>? data,
    String? id,
    String? token,
  }) {
    return getData(
      data: data,
      id: id,
      token: token,
    ).then((responseData) {
      Map<String, dynamic> modifiedData = StatusCode().executeByStatusCode(
        responseByStatus: responseByStatus,
        responseData: responseData,
      );
      statusType status = StatusCode().type(modifiedData["statusCode"]);
      if (status == statusType.CLIENT_ERROR ||
          status == statusType.SERVER_ERROR) {
        return ErrorModel(
          statusCode: modifiedData["statusCode"],
          message: modifiedData["message"],
          data: modifiedData["data"],
        );
      } else if (status == statusType.SUCCESS) {
        return ResponseModel(
          statusCode: modifiedData["statusCode"],
          message: modifiedData["message"],
          data: modifiedData["data"],
        );
      }
      return null;
    }).catchError(
      (error) {
        return ErrorModel(
          statusCode: 000,
          message: "Kindly check your internet connection",
        );
      },
    );
  }
}
