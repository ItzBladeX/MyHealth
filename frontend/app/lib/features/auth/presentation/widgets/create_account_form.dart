import 'package:app/providers/auth_provider.dart';
import 'package:app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key, required this.onSignInPressed});

  final VoidCallback onSignInPressed;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = true;

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void sendRequest() async {
    final String fullName = fullNameController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    final String password = passwordController.text.trim();

    final String normalizedFullName = fullName.replaceAll(RegExp(r'\s+'), ' ');

    if (!RegExp(r'^[A-Za-z]+ [A-Za-z]+$').hasMatch(normalizedFullName)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Full name must be in the format: <first name> <second name>',
          ),
        ),
      );
      return;
    }

    if (!AuthService.isValidPhoneNumber(phoneNumber) ||
        !AuthService.isValidPassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Use a valid phone number: +2519xxxxxxxx or +2517xxxxxxxx, and a password longer than 4 characters.',
          ),
        ),
      );
      return;
    }

    final bool success = await context.read<AuthProvider>().createAccount(
      normalizedFullName,
      phoneNumber,
      password,
    );

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to create account. Check your connection and try again.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: constraints.maxHeight > 600 ? 48 : 20,
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CreateAccountTextField(
                        label: 'Full Name',
                        hint: 'e.g John Donald',
                        icon: Icons.person_outline,
                        controller: fullNameController,
                      ),
                      const SizedBox(height: 20),
                      _CreateAccountTextField(
                        label: 'Phone Number',
                        hint: 'e.g. +251908070605 or +251701020304',
                        icon: Icons.account_circle_outlined,
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      _CreateAccountPasswordField(
                        controller: passwordController,
                        rememberMe: rememberMe,
                        onRememberMeChanged: (value) {
                          setState(() => rememberMe = value);
                        },
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: sendRequest,
                          child: const Text(
                            'Create Account',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: widget.onSignInPressed,
                            child: const Text('Sign in'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CreateAccountTextField extends StatelessWidget {
  const _CreateAccountTextField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.keyboardType,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Text(
              ' *',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}

class _CreateAccountPasswordField extends StatefulWidget {
  const _CreateAccountPasswordField({
    required this.controller,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  final TextEditingController controller;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  @override
  State<_CreateAccountPasswordField> createState() =>
      _CreateAccountPasswordFieldState();
}

class _CreateAccountPasswordFieldState
    extends State<_CreateAccountPasswordField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Text(
              ' *',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: obscurePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              tooltip: obscurePassword ? 'Show password' : 'Hide password',
              icon: Icon(
                obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() => obscurePassword = !obscurePassword);
              },
            ),
            hintText: 'Enter your Password',
            hintStyle: const TextStyle(fontSize: 14),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: widget.rememberMe,
              onChanged: (value) => widget.onRememberMeChanged(value ?? false),
            ),
            const Text('Remember me'),
          ],
        ),
      ],
    );
  }
}
