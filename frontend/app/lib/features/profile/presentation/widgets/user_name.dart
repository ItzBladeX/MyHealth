import 'package:flutter/material.dart';


Container userName() {
  return Container(
    margin: EdgeInsets.only(right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "Moti Niguse",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        
      ],
    ),
  );
}