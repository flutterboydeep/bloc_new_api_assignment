import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiDataProvider {
  Future<String> responsData() async {
    try {
      Map<String, String> headers = {
        "x-hasura-admin-secret":
            "32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6"
      };
      final response = await http.get(
          Uri.parse('https://intent-kit-16.hasura.app/api/rest/blogs'),
          headers: headers);
      if (response.statusCode == 200) {
        // Log response for debugging
        // log(response.body.toString());
        return response.body;
      } else {
        throw Exception(
            "Failed to load product: Status code ${response.statusCode}");
      }
    } on SocketException {
      throw "SocKetException";
    } catch (e) {
      log("API request error: $e");
      throw Exception("Some error Occurred ${e.toString()}");
    }
  }
}
//114