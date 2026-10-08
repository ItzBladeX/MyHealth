import 'package:app/features/auth/presentation/widgets/login_form.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('shows a snackbar for invalid phone number or short password', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: MaterialApp(
          home: Scaffold(body: LogIn(onButtonPressed: () {})),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).at(0), '+25112345678');
    await tester.enterText(find.byType(TextFormField).at(1), '123');
    await tester.tap(find.text('Sign in to MyHealth'));
    await tester.pump();

    expect(find.textContaining('Use a valid phone number'), findsOneWidget);
  });
}
