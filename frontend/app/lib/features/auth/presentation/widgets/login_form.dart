import 'package:app/providers/auth_provider.dart';
import 'package:app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  final VoidCallback onButtonPressed;
  const LogIn({super.key, required this.onButtonPressed});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController phoneNumberController = TextEditingController(text: "+251");
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = true;

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void sendRequest() async {
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text.trim();

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

    bool succes = await context.read<AuthProvider>().loginUser(
      phoneNumber,
      password,
    );

    if (!mounted) return;

    if (!succes) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to log in. Check your connection and try again.',
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
                  vertical: constraints.maxHeight > 600 ? 48.0 : 20.0,
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
                      _PhoneNumberField(controller: phoneNumberController),

                      const SizedBox(height: 20),

                      _PasswordField(
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
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: sendRequest,
                          child: const Text(
                            'Sign in to MyHealth',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(child: Text("Don't have an account?")),
                          TextButton(
                            onPressed: widget.onButtonPressed,
                            child: const Text('Create Account'),
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

class _PhoneNumberField extends StatefulWidget {
  const _PhoneNumberField({required this.controller});

  final TextEditingController controller;

  @override
  State<_PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<_PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Phone Number",
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

          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_circle_outlined),
            hintText: "e.g +251908070605",
            hintStyle: const TextStyle(fontSize: 14),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField({
    required this.controller,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  final TextEditingController controller;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Password",
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
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              tooltip: _obscurePassword ? 'Show password' : 'Hide password',
              icon: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() => _obscurePassword = !_obscurePassword);
              },
            ),
            hintText: "Enter your Password",
            hintStyle: const TextStyle(fontSize: 14),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: widget.rememberMe,
              onChanged: (value) {
                widget.onRememberMeChanged(value ?? false);
              },
            ),
            const Text('Remember me'),
          ],
        ),
      ],
    );
  }
}
