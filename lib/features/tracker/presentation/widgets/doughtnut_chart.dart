import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({super.key});

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: PieChart(
          PieChartData(sections: [

            PieChartSectionData(
              color: Colors.pink,
              value: 30,
              showTitle: false,
              title: "30%",
              radius: 80
            ),
            PieChartSectionData(
              color: Colors.amber,
              value: 12,
              showTitle: false,
              title: "12%",
              radius: 80
            ),
            PieChartSectionData(
              color: Colors.blueAccent,
              value: 18,
              showTitle: false,
              title: "18%",
              radius: 80
            ),
          ]),
          swapAnimationDuration: const Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear,
        ),
      ),
    );
  }
}
