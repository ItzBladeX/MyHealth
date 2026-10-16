
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_card.dart';
import 'package:app/features/profile/presentation/widgets/user_info.dart';
import 'package:app/features/profile/presentation/widgets/profile_image.dart';

class ProfilePage extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: profileAppBar(), body: profileCard());
  }

  ListView profileCard() {
    return ListView(
      children: [
        //Profile Card
        Center(
          child: Container(
            height: 200,
            margin: EdgeInsets.only(left: 16, right: 16, top: 20),
            constraints: BoxConstraints(maxWidth: 560),
            decoration: BoxDecoration(
              color: ColorConstants.cardBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 16),
                    profileImage(),
                    SizedBox(width: 16),
                    //User information [Name, ...]
                    userInfo(),
                  ],
                ),
                SizedBox(height: 16),
                MyHealthCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
