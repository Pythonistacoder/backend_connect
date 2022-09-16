import '../abstract/api_response_model.dart';

class ResponseModel extends ApiResponseModel {
  ResponseModel({
    super.data,
    super.message,
    required super.statusCode,
  });
}
