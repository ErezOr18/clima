import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    dynamic data = jsonDecode(response.body);
    return data;
  }
}
