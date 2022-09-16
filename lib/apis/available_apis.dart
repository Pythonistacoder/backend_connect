// ignore_for_file: non_constant_identifier_names

import '../models/backend_api.dart';
import '../response/response_functions_by_endpoints/serviceman_login.dart';
import '../utils/status_code.dart';
import 'endpoints.dart';

class AvailableApis {
  // static final ALL_CATEGORIES = BackendAPI(
  //   baseUrl: BaseUrls.FLASK_URL,
  //   httpVerb: "POST",
  //   endpoint: Endpoints.ALL_CATEGORIES,
  //   headerFormat: "",
  //   bodyFormat: """
  //     {
  //       "children":true
  //     }
  //     """,
  // );
  static final SERVICEMAN_LOGIN = BackendAPI(
    baseUrl: BaseUrls.NODE_URL,
    httpVerb: "POST",
    endpoint: Endpoints.SERVICEMAN_LOGIN,
    headerFormat: "",
    bodyFormat: """
      {
        "email":"debangshuroy60@gmail.com",
        "password":"DontChangeIt"
      }
      """,
    responseByStatus: ServicemanLogin(),
  );
  // static final SERVICEMAN_WORKLOGIN = BackendAPI(
  //   baseUrl: BaseUrls.NODE_URL,
  //   httpVerb: "PUT",
  //   endpoint: Endpoints.WORK_LOGIN,
  //   headerFormat: "{Authorization: token}",
  //   bodyFormat: """
  //     {
  //       "coordinates": [longitude, latitude]
  //     }
  //     """,
  // );
}

class FunctionByStatus {
  static final SERVICEMAN_LOGIN = {
    StatusCode.ACCEPTED: (responseData) {
      return {
        "data": responseData["body"],
        "message": "Token received for serviceman login",
        "statusCode": responseData["statusCode"],
      };
    }
  };
}
