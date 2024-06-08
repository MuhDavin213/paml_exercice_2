import 'dart:convert';
import 'package:http/http.dart' as http;

class RestoService {
  final String baseUrl = 'http://192.168.56.1/api/restoapi/';

  Future<List<Map<String, dynamic>>> getData() async {
    final response = await http.get(Uri.parse('$baseUrl/read.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/delete.php'),
      body: {"rate_resto": id},
    );
    return response.statusCode == 200;
  }
}
