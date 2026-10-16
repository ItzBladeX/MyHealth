import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_card.dart';
import 'package:app/features/profile/presentation/widgets/profile_image.dart';
import 'package:app/features/profile/presentation/widgets/user_info.dart';

ListView profileCard() {
  return ListView(
    children: [
      //Profile Card
      Center(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 20),
          constraints: BoxConstraints(maxWidth: 560, minHeight: 200),
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
