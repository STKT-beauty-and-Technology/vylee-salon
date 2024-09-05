import 'dart:convert';

import 'package:http/http.dart' as http;

String url = 'http://13.127.243.34:9090/vendor';

class DataProvider {
  static Future<http.Response> postData(
      String endpoint, Map<String, dynamic> body,
      {jwt = ""}) async {
    final http.Response response = await http.post(Uri.parse('$url/$endpoint'),
        headers: {"Content-Type": "application/json", "Authorization": jwt},
        body: jsonEncode(body));
    return response;
  }

  static Future<http.Response> getData(String endpoint, {jwt = ""}) async {
    final http.Response response = await http.get(Uri.parse('$url/$endpoint'),
      headers: {"Content-Type": "application/json", "Authorization": jwt},
    );
    return response;
  }

  static Future<http.Response> deleteData(String endpoint, String id,
      {jwt = ""}) async {
    final http.Response response = await http.delete(
        Uri.parse('$url/$endpoint/$id'),
      headers: {"Content-Type": "application/json", "Authorization": jwt},
    );
    return response;
  }
}
