

import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:app/features/profile/presentation/widgets/user_name.dart';


class UserInfo extends StatefulWidget {
  final String fullName;
  final String age;
  final String bloodType;
  const UserInfo({
    super.key,
    required this.fullName,
    required this.age,
    required this.bloodType,
  });

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          userName(widget.fullName),
          Row(
            children: [
              Icon(Icons.cake_outlined, color: ColorConstants.basecolor),
              Text(" ${widget.age} yrs", style: TextStyle(fontSize: 12)),
              Text(" | "),
              Icon(Icons.bloodtype_outlined, color: ColorConstants.basecolor),
              Text(
                "${widget.bloodType} ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
