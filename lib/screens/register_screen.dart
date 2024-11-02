import 'package:budget_in/data/account_manager.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("No account detected!"),
            const Text("Please input your name to save your data:"),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Your name"),
            ),
            ElevatedButton(
              onPressed: login,
              child: const Text("Save"),
            )
          ]),
        ),
      ),
    );
  }

  void login() async {
    String name = _nameController.text;
    if (name.isNotEmpty) {
      await saveAccount(name);

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      // Show an alert if the name field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Please enter your name to continue."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}
