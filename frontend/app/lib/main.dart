import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/auth/presentation//screens/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracting the text theme safely into a variable
    final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, // Ensures modern Material components inherit text themes correctly
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF00685F)), // Fixed the missing class name
        
        // text widgets (Text, SelectableText, RichText)
        textTheme: baseTextTheme,
        primaryTextTheme: baseTextTheme, 
      ),
      debugShowCheckedModeBanner: false,
      home: const Shell(),
    );
  }
}

class Shell extends StatefulWidget {
  const new({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    return const AuthPage();
  }
}
