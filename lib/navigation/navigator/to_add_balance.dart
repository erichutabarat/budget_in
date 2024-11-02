import 'package:flutter/material.dart';

Future<void> toAddBalance(
    BuildContext context, VoidCallback onUpdateBalance) async {
  final result = await Navigator.pushNamed(context, '/addbalance');
  if (result == true) {
    // Check if the result indicates success
    onUpdateBalance(); // Fetch the new balance
  }
}
