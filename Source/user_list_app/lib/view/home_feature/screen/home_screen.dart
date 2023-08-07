import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:user_list_app/repository/controller/user_controller.dart';
import 'package:user_list_app/view/home_feature/assets_exp.dart';
import 'package:user_list_app/view/home_feature/widget_exp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          HomeTexts.homeTitle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final userController = Get.find<UserController>();
              userController.fetchUsers();
            },
          ),
        ],
      ),
      body: Obx(() {
        final userController = Get.find<UserController>();
        if (userController.users.isEmpty) {
          return const WaitingHomeWidget();
        }
        return ListView.builder(
          itemCount: userController.users.length,
          itemBuilder: (context, index) {
            final user = userController.users[index];
            return UserCard(user: user);
          },
        );
      }),
    );
  }
}
