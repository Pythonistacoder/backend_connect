// ignore_for_file: non_constant_identifier_names

import '../../models/response_by_status.dart';

class ServicemanLogin extends ResponseByStatus {
  @override
  Map<String, dynamic> Function(dynamic) OK() => (responseData) {
        return {
          "data": responseData["body"],
          "message": "Token received for serviceman login",
          "statusCode": responseData["statusCode"],
        };
      };

  @override
  Map<String, dynamic> Function(dynamic) UNPROCESSABLE_ENTITY() =>
      (responseData) {
        return {
          "data": null,
          "message": responseData["body"]["message"],
          "statusCode": responseData["statusCode"],
        };
      };
}
