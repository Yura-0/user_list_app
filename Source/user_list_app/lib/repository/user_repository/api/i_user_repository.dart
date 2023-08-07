import 'package:user_list_app/model/user_model.dart';

abstract class IUserRepository {
  Future<List<UserModel>> getUsers(String url);
  Future<List<UserModel>> getUsersFromStorage();
  Future<UserModel> getUserDetails(String url, int userId);
  Future<UserModel> getUserDetailsFromStorage(int userId);
}
