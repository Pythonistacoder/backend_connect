abstract class ApiResponseModel {
  final String? message;
  final int statusCode;
  final Map<String, dynamic>? data;

  ApiResponseModel({
    this.message,
    this.data,
    required this.statusCode,
  });
}
