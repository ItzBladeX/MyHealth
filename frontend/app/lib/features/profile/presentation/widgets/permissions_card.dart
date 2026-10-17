import 'package:app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/features/profile/presentation/widgets/sharing_permissions_tile.dart';
import 'package:app/features/profile/presentation/widgets/biometric_security_tile.dart';
import 'package:app/features/profile/presentation/widgets/language_tile.dart';

class PermissionsCard extends StatelessWidget {
  const PermissionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: 560),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const SizedBox(height: 20),
            SharingPermissionsTile(),
            const SizedBox(height: 20),
            BiometricSecurityTile(),
            const SizedBox(height: 20),
            LanguageTile(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.shield_outlined, color: ColorConstants.basecolor, size: 24),
        const SizedBox(width: 10),
        const Text(
          'Privacy & Access',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
