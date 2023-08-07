import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_list_app/repository/controller/user_controller.dart';
import 'package:user_list_app/repository/user_repository/user_getter/user_repository.dart';
import 'package:user_list_app/user_list_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  UserRepository userRepository = UserRepository(prefs);

  Get.put(UserController(userRepository));

  runApp(const UserListApp());
}
