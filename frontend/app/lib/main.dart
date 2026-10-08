import 'package:app/database/database.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/features/auth/presentation//screens/auth.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    final baseTextTheme = GoogleFonts.plusJakartaSansTextTheme();

    return MultiProvider(
      providers: [
        Provider<AppDatabase>(
          create: (context) => AppDatabase(),
          dispose: (context,db) => db.close(),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider())


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true, 
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF00685F)), 
          
          
          textTheme: baseTextTheme,
          primaryTextTheme: baseTextTheme, 
        ),
        debugShowCheckedModeBanner: false,
        home: const Shell(),
      ),
    );
  }
}

class Shell extends StatefulWidget {
  const new({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {

  bool isLoggedIn()  {

    return context.watch<AuthProvider>().isLoggedIn();
   
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn() ? HomePage(): AuthPage();
  }
}


class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  


  @override
  Widget build(BuildContext context) {
    final String? token = context.watch<AuthProvider>().token;
    final String? uuid =  context.watch<AuthProvider>().userUUID;
    return Scaffold(
      body: SafeArea(child: Text("Welcome User $uuid, token: $token"))
    );
  }
}
