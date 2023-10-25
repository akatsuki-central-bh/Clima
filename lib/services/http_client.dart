import 'package:http/http.dart' as http;

class HttpClient {
  final client = http.Client();

  Future get({
    required String url,
    required Map<String, String> headers,
  }) async {
    return await client.get(Uri.parse(url), headers: headers);
  }
}
