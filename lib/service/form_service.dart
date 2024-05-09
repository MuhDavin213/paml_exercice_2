import 'package:http/http.dart' as http;

class RestoService {
  final String baseUrl = 'http://192.168.1.33/api/restoapi/';

  Future<bool> createData(Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create.php'),
      body: data,
    );
    return response.statusCode == 200;
  }
}
