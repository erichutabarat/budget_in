import 'package:flutter/material.dart';

Widget incomeCard(String date, double amount, String from) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(color: Colors.blueGrey),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(from), Text("Rp. ${amount.toString()}")],
            )
          ],
        ),
      ),
      const SizedBox(height: 10)
    ],
  );
}
