/// Support for doing something awesome.
///
/// More dartdocs go here.
library backend_connect;

import 'apis/available_apis.dart';

// ignore_for_file: non_constant_identifier_names

class ApiResponses {
  // ignore: prefer_function_declarations_over_variables
  static final SERVICEMAN_LOGIN = ({
    Map<String, dynamic>? data,
  }) {
    return AvailableApis.SERVICEMAN_LOGIN
        .getResponse(
          data: data,
        )
        .then(
          (responseModel) => responseModel,
        );
  };
}
