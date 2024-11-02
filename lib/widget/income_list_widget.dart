import 'package:budget_in/data/income.dart';
import 'package:budget_in/widget/card/income_card.dart';
import 'package:flutter/material.dart';

Widget incomeListWidget(List<Income> incomeList) {
  double itemHeight = 80.0;
  double widgetHeight = itemHeight * incomeList.length;
  if (incomeList.isEmpty) {
    return const Text("No data income");
  }
  return GestureDetector(
    onTap: () {
      // You can add any tap action here if needed
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      height: widgetHeight,
      child: ListView.builder(
        physics:
            const NeverScrollableScrollPhysics(), // Disable ListView scrolling
        itemCount: incomeList.length,
        itemBuilder: (context, index) {
          final income = incomeList[index];
          return incomeCard(income.date, income.amount, income.from);
        },
      ),
    ),
  );
}
