import 'package:budget_in/navigation/navigator/to_add_balance.dart';
import 'package:flutter/material.dart';

Widget balanceWidget(
    BuildContext context, String balance, VoidCallback onUpdateBalance) {
  return Container(
    width: double.infinity,
    height: 120,
    padding: const EdgeInsets.all(1),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.lightBlue,
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Current Balance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Rp: $balance",
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.money),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  // Call the onRefresh callback when the button is tapped
                  toAddBalance(context, onUpdateBalance);
                },
                child: const Icon(Icons.add, size: 30),
              )
            ],
          )
        ],
      ),
    ),
  );
}
