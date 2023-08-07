import 'package:get/get.dart';

import 'package:user_list_app/core/api_urls.dart';
import 'package:user_list_app/model/user_model.dart';
import 'package:user_list_app/repository/user_repository/api/i_user_repository.dart';

class UserController extends GetxController {
  final IUserRepository _userRepository;
  RxList<UserModel> users = <UserModel>[].obs;

  UserController(this._userRepository);

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    final fetchedUsers = await _userRepository.getUsers(ApiUrls.users);
    users.assignAll(fetchedUsers);
  }

  Future<UserModel> fetchUserDetails(int userId) async {
    return await _userRepository.getUserDetails(ApiUrls.users, userId);
  }

  Future<UserModel> fetchUserDetailsFromStorage(int userId) async {
    return await _userRepository.getUserDetailsFromStorage(userId);
  }
}
