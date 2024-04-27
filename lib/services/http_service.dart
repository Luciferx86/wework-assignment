import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wework/utils/constants.dart';

class HttpService {
  final String _baseUrl;

  HttpService(
    this._baseUrl,
  );
  Future<Response> getRequest(
    String endpoint, {
    Map<String, String>? requestHeaders,
  }) async {
    requestHeaders = addHeaders(
      requestHeaders: requestHeaders ?? {},
    );
    late Response response;
    try {
      Uri uri = Uri.parse("$_baseUrl$endpoint");
      response = await http.get(
        uri,
        headers: requestHeaders,
      );
    } catch (e) {
      print(e);
    }
    return response;
  }

  // Can write body for `POST`, `PUT', `PATCH` and `DELETE` request similar to get request, but is unncessary for this project

  Map<String, String> addHeaders({
    required Map<String, String> requestHeaders,
    String? hashKey,
  }) {
    Map<String, String> headers = {};
    String? token = Constants.API_BEARER_TOKEN;
    headers["Authorization"] = "Bearer $token";

    // Can add other app generic headers here. Not necessary for this project
    return headers;
  }
}
