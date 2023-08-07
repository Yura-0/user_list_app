import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_list_app/model/user_model.dart';
import 'package:user_list_app/view/user_details_feature/screen/user_details_screen.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        onTap: () {
          Get.to(() => UserDetailsScreen(userId: user.id));
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text(user.email),
      ),
    );
  }
}
