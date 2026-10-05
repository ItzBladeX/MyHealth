import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logo.png', width: 64, height: 64),
        const SizedBox(height: 20),
        Text(
          "Welcome to MyHealth",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight(1000)),
        ),
      ],
    );
  }
}
