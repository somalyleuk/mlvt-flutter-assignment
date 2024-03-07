import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/configs/env.dart';

class ApiService {
  static Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(Env.apiURL));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
