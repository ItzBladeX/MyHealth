import 'package:flutter/material.dart';


Container userName(String name) {
  
  return Container(
    margin: EdgeInsets.only(right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        
      ],
    ),
  );
}