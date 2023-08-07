import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:user_list_app/model/user_model.dart';
import 'package:user_list_app/repository/controller/user_controller.dart';
import 'package:user_list_app/view/user_details_feature/assets_exp.dart';
import 'package:user_list_app/view/user_details_feature/widgets_exp.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;

  const UserDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(UserDetailsTexts.userDetailsTitle),
        centerTitle: true,
      ),
      body: Obx(() {
        final UserModel user = userController.users.firstWhere(
          (user) => user.id == userId,
          orElse: () => UserModel(
            id: -2,
            email: '',
            firstName: '',
            lastName: '',
            avatar: '',
          ),
        );
        if (user.id == -2) {
          // If data is not received from the Internet
          final UserModel userFromStorage =
              userController.fetchUserDetailsFromStorage(userId) as UserModel;
          if (userFromStorage.id == -1) {
            // If data is not retrieved from storage
            return const WaitingDetailsWidget();
          }
          return UserDetailsWidget(user: userFromStorage);
        }
        return UserDetailsWidget(user: user);
      }),
    );
  }
}
