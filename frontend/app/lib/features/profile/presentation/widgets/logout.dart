import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/core/constants.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
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
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthProvider>().logoutUser();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: ColorConstants.redBackground,
            foregroundColor: ColorConstants.redText,
            minimumSize: const Size(
              double.infinity,
              56,
            ), // Full-width button layout
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout_rounded, size: 20),
              SizedBox(width: 8),
              Text(
                'Log Out of MyHealth',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
