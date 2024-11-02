import 'package:budget_in/screens/add_balance_screen.dart';
import 'package:budget_in/screens/home_screen.dart';
import 'package:budget_in/screens/loading_screen.dart';
import 'package:budget_in/screens/logout_screen.dart';
import 'package:budget_in/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Budget.in",
      theme: ThemeData.dark(),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/logout': (context) => const LogoutScreen(),
        '/addbalance': (context) => const AddBalanceScreen()
      },
    );
  }
}
