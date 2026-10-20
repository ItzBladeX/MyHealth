import 'package:flutter/material.dart';

class MyHealthDialogHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/logo.png', width: 36, height: 36),
        const SizedBox(width: 8),
        const Text(
          "MyHealth ID",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}
