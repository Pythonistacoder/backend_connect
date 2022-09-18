import 'package:backend_connect/backend_connect.dart';
import 'package:backend_connect/response/models/implementation/error_model.dart';

void main() {
  ApiResponses.SERVICEMAN_LOGIN(
    data: {
      "email": "debangshuroy60@gmail.com",
      "password": "DontChangeIt",
    },
  ).then((responseModel) {
    if (responseModel != null) {
      print(responseModel.message);
      print(responseModel is ErrorModel);
    } else {
      print("No model");
    }
  });
}
