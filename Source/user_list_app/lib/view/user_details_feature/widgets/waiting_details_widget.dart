import 'package:flutter/material.dart';

import 'package:user_list_app/view/user_details_feature/assets_exp.dart';

class WaitingDetailsWidget extends StatelessWidget {
  const WaitingDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(height: 30),
          Text(
            UserDetailsTexts.waitingtext,
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
