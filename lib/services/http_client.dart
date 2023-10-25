import 'package:http/http.dart' as http;

class HttpClient {
  final client = http.Client();

  @override
  // url, headers, body, timeout
  Future get({
    required String url,
    required Map<String, String> headers,
  }) async {
    return await client.get(Uri.parse(url), headers: headers);
  }
}
