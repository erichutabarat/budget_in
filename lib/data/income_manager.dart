import 'dart:convert';
import 'package:budget_in/data/income.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveIncome(Income income) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? incomeList = prefs.getStringList('income_list') ?? [];

  incomeList.add(jsonEncode(income.toJson()));

  await prefs.setStringList('income_list', incomeList);
}

Future<List<Income>> loadIncome() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? incomeList = prefs.getStringList('income_list') ?? [];

  return incomeList.map((item) {
    return Income.fromJson(jsonDecode(item));
  }).toList();
}
