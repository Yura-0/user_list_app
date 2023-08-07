import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_list_app/model/user_model.dart';
import 'package:user_list_app/repository/user_repository/api/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final http.Client _client = http.Client();
  final SharedPreferences _prefs;

  UserRepository(this._prefs);

  Future<void> _saveUsersToStorage(List<UserModel> users) async {
    final encodedUsers =
        users.map((user) => json.encode(user.toMap())).toList();
    _prefs.setStringList('users', encodedUsers);
  }

  @override
  Future<List<UserModel>> getUsers(String url) async {
    try {
      final response = await _client.get(Uri.parse('$url?page=2'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final users = (data['data'] as List)
            .map((userData) => UserModel(
                  id: userData['id'],
                  email: userData['email'],
                  firstName: userData['first_name'],
                  lastName: userData['last_name'],
                  avatar: userData['avatar'],
                ))
            .toList();

        _saveUsersToStorage(users);
        return users;
      }
      return [];
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  @override
  Future<List<UserModel>> getUsersFromStorage() async {
    final encodedUsers = _prefs.getStringList('users');
    if (encodedUsers != null) {
      final users = encodedUsers.map((encodedUser) {
        final userMap = json.decode(encodedUser);
        return UserModel.fromMap(userMap);
      }).toList();
      return users;
    }
    return [];
  }

  @override
  Future<UserModel> getUserDetails(String url, int userId) async {
    try {
      final response = await _client.get(Uri.parse('$url/$userId'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final userMap = data['data'];
        return UserModel(
          id: userMap['id'],
          email: userMap['email'],
          firstName: userMap['first_name'],
          lastName: userMap['last_name'],
          avatar: userMap['avatar'],
        );
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      print('Error fetching user details: $e');
      return UserModel(
        id: -2,
        email: '',
        firstName: '',
        lastName: '',
        avatar: '',
      );
    }
  }

  @override
  Future<UserModel> getUserDetailsFromStorage(int userId) async {
    final storedUsers = await getUsersFromStorage();
    final user = storedUsers.firstWhere((user) => user.id == userId,
        orElse: () => UserModel(
            id: -1, email: '', firstName: '', lastName: '', avatar: ''));
    return user;
  }
}
