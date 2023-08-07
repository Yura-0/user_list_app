import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_list_app/view/home_feature/screen/home_screen.dart';

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'User App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
