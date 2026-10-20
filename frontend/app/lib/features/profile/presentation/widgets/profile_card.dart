import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/myhealth_tile.dart';
import 'package:app/features/profile/presentation/widgets/profile_image.dart';
import 'package:app/features/profile/presentation/widgets/user_info.dart';
import 'package:app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String fullName = '';
  String phonenumber = '';
  String age = '-';
  String bloodType = '';
  DateTime? birthdate;
  double weight = 0.0;
  double height = 0.0;

  void loadUser(BuildContext context) {
    final Map<String, dynamic> userInfo =
        context.watch<UserProvider>().userInfo ?? {};

    final Map<String, dynamic> userData =
        context.watch<UserProvider>().userData ?? {};

    if (userInfo != {}) {
      fullName = userInfo['name'] ?? '-';
      phonenumber = userInfo['phonenumber'] ?? '-';
      // print("Loaded User Data");
      // print("name: $fullName");
    }
    if (userData != {}) {
      height = (userData['height'] as num?)?.toDouble() ?? 0.0;
      weight = (userData['weight'] as num?)?.toDouble() ?? 0.0;
      bloodType = userData['bloodtype'] ?? "-";
      birthdate = userData['birthdate'];

      final birthdateLocal = birthdate;
      if (birthdateLocal != null) {
        DateTime today = DateTime.now();
        int currentAge = today.year - birthdateLocal.year;
        if (today.month < birthdateLocal.month ||
            (today.month == birthdateLocal.month &&
                today.day < birthdateLocal.day)) {
          currentAge--;
        }
        age = "$currentAge";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    loadUser(context);
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
                UserInfo(fullName: fullName, age: age, bloodType: bloodType),
              ],
            ),
            SizedBox(height: 16),
            MyHealthCard(
              fullName: fullName,
              phonenumber: phonenumber,
              bloodType: bloodType,
              birthdate: birthdate,
              weight: weight,
              height: height,
            ),
          ],
        ),
      ),
    );
  }
}
