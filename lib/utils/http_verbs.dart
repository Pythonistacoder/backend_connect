// ignore_for_file: constant_identifier_names

import 'package:http/http.dart' as http;

class HttpVerb {
  static const POST = "POST";
  static const PUT = "PUT";
  static const GET = "GET";
  static const DELETE = "DEL";

  /// provides the list of available http verbs to work upon
  List<String> availableHttpVerbs() {
    return [GET, POST, PUT, DELETE];
  }

  Future<http.Response?> getResponse({
    required String body,
    required String url,
    required String httpVerb,
    required Map<String, String> headers,
  }) async {
    // It takes one of the http Verb:
    // GET, DEL, PUT, POST

    switch (httpVerb) {
      case POST:
        return http.post(
          Uri.parse(url),
          headers: headers,
          body: body,
        );
      case GET:
        return http.get(
          Uri.parse(url),
          headers: headers,
        );
      case PUT:
        return http.put(
          Uri.parse(url),
          headers: headers,
          body: body,
        );
      case DELETE:
        return http.delete(
          Uri.parse(url),
          headers: headers,
          body: body,
        );
      default:
        throw Exception("INCORRECT HTTP VERB");
    }
  }
}
