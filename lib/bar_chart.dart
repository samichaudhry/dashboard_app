import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartWithTitle extends StatelessWidget {
  final Color barColor;
  final double amount;
  final String title;
  final VoidCallback onPressedFunc;

  const BarChartWithTitle({
    Key? key,
    required this.title,
    required this.amount,
    required this.barColor,
    required this.onPressedFunc,
  }) : super(key: key);

  static BarChartGroupData makeGroupData(
      int x, double y1, Color barColor, double width) {
    return BarChartGroupData(
      barsSpace: 1,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [barColor],
          width: width,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ],
    );
  }

  static List<BarChartGroupData> getBarChartData(Color color,
      {double width = 20}) {
    return [
      makeGroupData(0, 17, color, width),
      makeGroupData(1, 15, color, width),
      makeGroupData(2, 20, color, width),
      makeGroupData(3, 15, color, width),
      makeGroupData(4, 10, color, width),
      makeGroupData(5, 17, color, width),
      makeGroupData(6, 20, color, width),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              IconButton(
                  onPressed: onPressedFunc,
                  icon: const Icon(Icons.more_vert_rounded)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "\$",
                  style: const TextStyle(
                    fontSize: 16 * 0.7,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: "$amount",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'on this week',
                style: TextStyle(
                  color: Color(0xff77839a),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 38,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Colors.grey,
                    getTooltipItem: (_a, _b, _c, _d) => null,
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: SideTitles(showTitles: false),
                  topTitles: SideTitles(showTitles: false),
                  leftTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    rotateAngle:
                        MediaQuery.of(context).size.width >= 1100 ? 0 : 45,
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                      color: Color(0xffc4c4c4),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Mon';
                        case 1:
                          return 'Tue';
                        case 2:
                          return 'Wed';
                        case 3:
                          return 'Thu';
                        case 4:
                          return 'Fri';
                        case 5:
                          return 'Sat';
                        case 6:
                          return 'Sun';
                        default:
                          return '';
                      }
                    },
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: getBarChartData(
                  barColor,
                  width: MediaQuery.of(context).size.width >= 1100 ? 25 : 10,
                ),
                gridData: FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
