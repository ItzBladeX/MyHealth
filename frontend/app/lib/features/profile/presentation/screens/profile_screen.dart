import 'package:flutter/material.dart';
import 'package:app/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:app/features/profile/presentation/widgets/allergies_card.dart';

import 'package:app/features/profile/presentation/widgets/profile_card.dart';
import 'package:app/features/profile/presentation/widgets/permissions_card.dart';
import 'package:app/features/profile/presentation/widgets/logout.dart';
import 'package:app/app_bar.dart';
class ProfilePage extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar("Profile"), body: Profile());
  }
}

class Profile extends StatefulWidget {
  const new({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        ProfileCard(),
        SizedBox(height: 20),
        AllergiesCard(),
        SizedBox(height: 20),
        PermissionsCard(),
        SizedBox(height: 20),
        LogoutButton(),
        SizedBox(height: 20),
      ],
    );
  }
}
