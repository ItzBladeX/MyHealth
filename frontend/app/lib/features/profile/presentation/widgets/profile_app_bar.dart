import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';



AppBar profileAppBar() {
    return AppBar(

      titleSpacing: 20,
      toolbarHeight: 64,
      actionsPadding: EdgeInsets.all(20),
      backgroundColor: ColorConstants.pageBackground,
      title: Row(
        children: [
          Image.asset('assets/images/logo.png', width: 48, height: 48),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MyHealth", style: TextStyle(fontWeight: FontWeight(800))),
              Text("Profile", style: TextStyle(color: ColorConstants.basecolor,fontWeight: FontWeight.bold, fontSize: 12))
            ],
          )
        ],
      ),
      actions: [Icon(Icons.notifications_none_outlined),],
    );
  }
