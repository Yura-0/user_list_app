import 'package:flutter/material.dart';

import 'package:user_list_app/model/user_model.dart';
import 'package:user_list_app/view/user_details_feature/assets_exp.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserModel user;

  const UserDetailsWidget({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.33,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(user.avatar),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
                radius: 100,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 16),
          Text(
            '${UserDetailsTexts.email} ${user.email}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 16),
          Text(
            '${UserDetailsTexts.id} ${user.id}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
