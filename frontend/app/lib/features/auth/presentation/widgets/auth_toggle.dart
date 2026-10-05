import 'package:flutter/material.dart';

class AuthToggleSelector extends StatefulWidget {
  final String selectedAuthType;
  final ValueChanged<String> onSessionChange;

  const AuthToggleSelector({
    super.key,
    required this.selectedAuthType,
    required this.onSessionChange,
  });

  @override
  State<AuthToggleSelector> createState() => _AuthToggleSelectorState();
}

class _AuthToggleSelectorState extends State<AuthToggleSelector> {
  @override
  Widget build(BuildContext context) {
    final isCreateAccountSelected = widget.selectedAuthType == 'Create Account';

    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFE5EEFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: isCreateAccountSelected
                ? _buildUnselectedTab(
                    label: 'Sign In',
                    icon: Icons.login_rounded,

                    onTap: () {
                      widget.onSessionChange("Sign In");
                    },
                  )
                : _buildSelectedTab(
                    label: 'Sign In',
                    icon: Icons.login_rounded,
                    textColor: const Color(0xFF004D40),
                  ),
          ),

          Expanded(
            child: isCreateAccountSelected
                ? _buildSelectedTab(
                    label: 'Create Account',
                    icon: Icons.person_add_alt_1_rounded,
                    textColor: const Color(0xFF37474F),
                  )
                : _buildUnselectedTab(
                    label: 'Create Account',
                    icon: Icons.person_add_alt_1_rounded,
                    onTap: () {
                      widget.onSessionChange("Create Account");
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedTab({
    required String label,
    required IconData icon,
    required Color textColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnselectedTab({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF455A64), size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF455A64),
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
