import 'package:dashboard_app/bar_chart.dart';
import 'package:dashboard_app/custom_box.dart';
import 'package:flutter/material.dart';

class ExpensePanel extends StatefulWidget {
  const ExpensePanel({Key? key}) : super(key: key);

  @override
  State<ExpensePanel> createState() => _ExpensePanelState();
}

class _ExpensePanelState extends State<ExpensePanel> {
  double weeklyAmount = 2500;
  @override
  Widget build(BuildContext context) {
    return BarChartWithTitle(
        title: "Expense",
        amount: weeklyAmount,
        barColor: const Color(0xff52beff),
        onPressedFunc: () {});
  }
}
