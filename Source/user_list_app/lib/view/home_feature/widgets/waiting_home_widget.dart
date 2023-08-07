import 'package:flutter/material.dart';
import 'package:user_list_app/view/home_feature/assets_exp.dart';

class WaitingHomeWidget extends StatelessWidget {
  const WaitingHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 30),
          Text(
            HomeTexts.waitingText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
