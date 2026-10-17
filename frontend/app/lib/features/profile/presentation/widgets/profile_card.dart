import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_tile.dart';
import 'package:app/features/profile/presentation/widgets/profile_image.dart';
import 'package:app/features/profile/presentation/widgets/user_info.dart';

class ProfileCard extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: ColorConstants.cardBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
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
    );
  }
}
