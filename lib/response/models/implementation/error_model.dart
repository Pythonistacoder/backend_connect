import '../abstract/api_response_model.dart';

class ErrorModel extends ApiResponseModel {
  ErrorModel({
    super.data,
    super.message,
    required super.statusCode,
  });

  throwExceptionwithMessage() {
    throw Exception(message);
  }
}
