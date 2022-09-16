// ignore_for_file: constant_identifier_names, camel_case_types

import '../models/response_by_status.dart';

class StatusCode {
  static const int OK = 200; // expected response
  static const int CREATED = 201; // resource has been created
  static const int ACCEPTED =
      202; // request accepted but resource may not be created

  /// redirection is not considered for now
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int METHOD_NOT_ALLOWED = 405;
  static const int UNPROCESSABLE_ENTITY = 422;

  statusType type(int statusCode) {
    switch (statusCode ~/ 100) {
      case 1:
        return statusType.INFORMATIONAL;
      case 2:
        return statusType.SUCCESS; // use response model
      case 3:
        return statusType.REDIRECTION;
      case 4:
        return statusType.CLIENT_ERROR; // use error model
      case 5:
        return statusType.SERVER_ERROR; // use error model
      default:
        return statusType.SUCCESS;
    }
  }

  Map<String, dynamic> executeByStatusCode({
    required ResponseByStatus responseByStatus,
    required Map<String, dynamic> responseData,
  }) {
    switch (responseData["statusCode"]) {
      case OK:
        Function func = responseByStatus.OK();
        return func(responseData);
      case UNPROCESSABLE_ENTITY:
        Function func = responseByStatus.UNPROCESSABLE_ENTITY();
        return func(responseData);
      default:
        return {
          "data": responseData["body"],
          "statusCode": responseData["statusCode"],
          "message":
              "No function has been defined for ${responseData["statusCode"]}",
        };
    }
  }
}

enum statusType {
  INFORMATIONAL,
  SUCCESS,
  REDIRECTION,
  CLIENT_ERROR,
  SERVER_ERROR
}
