import 'package:budget_in/data/balance_manager.dart';
import 'package:budget_in/data/income.dart';
import 'package:budget_in/data/income_manager.dart';
import 'package:budget_in/widget/income_list_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:budget_in/data/account_manager.dart';
import 'package:budget_in/widget/balance_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Income> _incomeList;
  String name = '';
  String balance = "0.0";

  @override
  void initState() {
    super.initState();
    _initializeAccount();
    _fetchBalance();
    if (kDebugMode) {
      print("Balance: $balance");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          GestureDetector(
            onTap: () {
              toLogoutScreen(context);
            },
            child: const Icon(Icons.logout, size: 30),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.notifications, size: 30)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            balanceWidget(context, balance, _fetchBalance),
            const SizedBox(height: 20),
            const Text("Income", style: TextStyle(fontSize: 20)),
            incomeListWidget(_incomeList),
          ],
        ),
      ),
    );
  }

  Future<void> _initializeAccount() async {
    if (await checkAccount()) {
      final accountName = await getAccount() as String;
      setState(() {
        name = accountName;
      });
    } else {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/register');
      }
    }
  }

  Future<void> _fetchBalance() async {
    double fetchedBalance = await getBalance();
    setState(() async {
      balance = fetchedBalance.toString();
      _incomeList = await loadIncome();
    });
  }

  Future<void> toBalanceScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/addbalance');
    if (result == true) {
      await _fetchBalance();
    }
  }

  void toLogoutScreen(BuildContext context) {
    Navigator.pushNamed(context, '/logout');
  }
}
