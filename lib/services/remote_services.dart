import 'package:http/http.dart' as http;
import 'package:quickserve/models/user_model.dart';

class RemoteServices {
  static Future<List<User>> fetchUsers() async {
    final client = http.Client();
    final uri = Uri.parse('https://dummyjson.com/users');
    final responds = await client.get(uri);
    if (responds.statusCode == 200) {
      final welcome = welcomeFromJson(responds.body);
      return welcome.users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
