import 'package:budget_in/data/income.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  // Controllers for TextFields
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // ignore: prefer_const_constructors
  final Uuid uuid = Uuid(); // UUID generator instance

  Future<void> saveIncome(Income income) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? incomeList = prefs.getStringList('income_list') ?? [];

    incomeList.add(jsonEncode(income.toJson()));
    await prefs.setStringList('income_list', incomeList);
  }

  void _submitIncome() {
    try {
      final income = Income(
        id: uuid.v4(), // Generate a unique ID
        date: _dateController.text,
        amount: double.parse(_amountController.text),
        from: _fromController.text,
        description: _descriptionController.text,
      );

      saveIncome(income).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Income data saved!")),
        );
      });
      // Go back to the previous screen after success
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid amount")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Income (Balance)")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Please Input Income Data:"),
            const SizedBox(height: 10),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: "Date",
                suffixIcon: TextButton(
                  onPressed: () {
                    final today =
                        DateFormat('yyyy-MM-dd').format(DateTime.now());
                    setState(() {
                      _dateController.text = today;
                    });
                  },
                  child: const Text("Today"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _fromController,
              decoration: const InputDecoration(labelText: "From"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitIncome,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers when not in use
    _dateController.dispose();
    _amountController.dispose();
    _fromController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
