// ignore_for_file: non_constant_identifier_names

abstract class ResponseByStatus {
  ResponseByStatus();

  Map<String, dynamic> Function(dynamic) OK() => (responseData) {
        return {};
      };

  Map<String, dynamic> Function(dynamic) UNPROCESSABLE_ENTITY() =>
      (responseData) {
        return {};
      };
}
