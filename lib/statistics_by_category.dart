import 'package:dashboard_app/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SatisticsByCategoryPanel extends StatefulWidget {
  const SatisticsByCategoryPanel({Key? key}) : super(key: key);

  @override
  State<SatisticsByCategoryPanel> createState() =>
      _SatisticsByCategoryPanelState();
}

class _SatisticsByCategoryPanelState extends State<SatisticsByCategoryPanel> {
  int touchedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  // dummy Data
  List<Expenses> expense = <Expenses>[
    Expenses(
      color: const Color(0xfffedd69),
      expenseName: "Other expenses",
      expensePercentage: 35,
    ),
    Expenses(
      color: const Color(0xffff698a),
      expenseName: "Entertainment",
      expensePercentage: 30,
    ),
    Expenses(
      color: const Color.fromARGB(255, 133, 230, 22),
      expenseName: "ABC",
      expensePercentage: 15,
    ),
    Expenses(
      color: const Color(0xff52b3ff),
      expenseName: "Investments",
      expensePercentage: 10,
    )
  ];

// Pie Chart
  Widget _pieChartFunc(List<ChartData> data) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              touchedIndex == -1
                  ? "100%"
                  : "${data[touchedIndex].dataValue.toStringAsFixed(0)}%",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PieChart(
            PieChartData(
              sections: data
                  .map(
                    (ds) => PieChartSectionData(
                      color: ds.dataColor,
                      value: ds.dataValue,
                      radius: touchedIndex == data.indexOf(ds) ? 32.0 : 25.0,
                      title: '',
                    ),
                  )
                  .toList(),
              pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 2,
              centerSpaceRadius: 45,
            ),
            swapAnimationDuration: const Duration(milliseconds: 150),
            swapAnimationCurve: Curves.bounceInOut,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: customBox("Satistics By Category", Container(), [
        Expanded(
          child: _pieChartFunc(
            expense
                .map(
                  (ds) => ChartData(
                      dataValue: ds.expensePercentage, dataColor: ds.color),
                )
                .toList(),
          ),
        ),
        Expanded(
            child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFf2f6fe),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(2),
              itemCount: expense.length,
              itemBuilder: (context, index) {
                return customExpenseTile(
                    expense[index].color,
                    expense[index].expenseName,
                    expense[index].expensePercentage);
              }),
        )),
      ]),
    );
  }
}

//Expense Tile In statistic Panel

Widget customExpenseTile(_color, _expenseName, double _expensePercent) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
    child: Row(
      children: [
        Container(
          height: 10,
          width: 10,
          margin: const EdgeInsets.only(right: 18),
          decoration: BoxDecoration(
            color: _color,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            "$_expenseName - ${_expensePercent.round()}%",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(Icons.chevron_right),
      ],
    ),
  );
}

class Expenses {
  final String expenseName;
  final Color color;
  final double expensePercentage;
  Expenses(
      {required this.expenseName,
      required this.color,
      required this.expensePercentage});
}

class ChartData {
  final double dataValue;
  final Color dataColor;

  ChartData({required this.dataValue, required this.dataColor});
}
