import 'package:dashboard_app/bar_chart.dart';
import 'package:dashboard_app/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomePanel extends StatefulWidget {
  const IncomePanel({Key? key}) : super(key: key);

  @override
  State<IncomePanel> createState() => _IncomePanelState();
}

class _IncomePanelState extends State<IncomePanel> {
  double weeklyAmount = 5590;

  @override
  Widget build(BuildContext context) {
    return BarChartWithTitle(
        title: "Income",
        amount: weeklyAmount,
        barColor: const Color(0xffff698a),
        onPressedFunc: () {});
  }
}
