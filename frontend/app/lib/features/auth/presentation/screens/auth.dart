import 'package:flutter/material.dart';
import 'package:app/features/auth/presentation/widgets/welcome_widget.dart';
import 'package:app/features/auth/presentation/widgets/auth_toggle.dart';
import 'package:app/features/auth/presentation/widgets/auth_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _currentAuthType = "Sign In";
  @override
  Widget build(BuildContext context) {
    void _handleChange(String newType) {
      setState(() {
        _currentAuthType = newType;
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              WelcomeText(),
              SizedBox(height: 24),
              AuthToggleSelector(
                selectedAuthType: _currentAuthType,
                onSessionChange: (newType) {
                  _handleChange(newType);
                },
              ),
              AuthForm(
                authFormType: _currentAuthType,
                onTypeChange: _handleChange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
