import 'package:http/http.dart' as http;

class HttpClient {
  final client = http.Client();

  Future get({
    required Uri uri,
    required Map<String, String> headers,
  }) async {
    return await client.get(uri, headers: headers);
  }
}
