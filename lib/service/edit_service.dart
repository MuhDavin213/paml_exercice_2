import 'package:http/http.dart' as http;

class RestoService {
  final String baseUrl = 'http://192.168.1.33/api/restoapi/';

  Future<bool> updateData(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/edit.php'),
      body: data,
    );
    return response.statusCode == 200;
  }
}
