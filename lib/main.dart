import 'package:chattr_app/infrastructure/presentation/auth/auth_state.dart';
import 'package:chattr_app/infrastructure/presentation/auth/login_screen.dart';
import 'package:chattr_app/infrastructure/presentation/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if(!authProvider.isInitialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: authProvider.user != null ? ChatScreen() : LoginScreen(),
    );
  }
}