import 'package:flutter/material.dart';
import 'package:app/features/auth/presentation/widgets/login_form.dart';

class AuthForm extends StatefulWidget {
  final String authFormType;
  final ValueChanged<String> onTypeChange;
  const AuthForm({
    super.key,
    required this.authFormType,
    required this.onTypeChange,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    if (widget.authFormType == 'Sign In') {
      return LogIn(
        onButtonPressed: () => widget.onTypeChange('Create Account'),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Register'),
        TextButton(
          onPressed: () => widget.onTypeChange('Sign In'),
          child: const Text('Already have an account? Sign in'),
        ),
      ],
    );
  }
}
