import 'dart:convert';

import 'package:budget_in/data/income.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<double> getBalance() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? incomeList = prefs.getStringList('income_list') ?? [];
  double totalIncome = 0.0;

  for (String item in incomeList) {
    Income income = Income.fromJson(jsonDecode(item));
    totalIncome += income.amount;
  }

  return totalIncome;
}
