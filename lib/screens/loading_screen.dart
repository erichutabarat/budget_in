import 'dart:async';
import 'package:budget_in/data/account_manager.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    await Future.delayed(const Duration(seconds: 4));
    bool loggedIn = await checkAccount();
    if (loggedIn) {
      navigateToHome();
    } else {
      navigateToRegister();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Welcome to Budget.in"),
            Text("Developed by Eric Devs")
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void navigateToRegister() {
    Navigator.pushReplacementNamed(context, '/register');
  }
}
