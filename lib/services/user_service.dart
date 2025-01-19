import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class UserService {
  static const String _baseUrl = 'https://reqres.in/api/users';

  Future<List<User>> fetchUsers(int page) async {
    final response = await http.get(Uri.parse('$_baseUrl?page=$page&per_page=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<User> users = [];
      for (var userJson in data['data']) {
        users.add(User.fromJson(userJson));
      }
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
