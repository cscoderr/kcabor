import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MonthlyRevenue extends StatelessWidget {
  const MonthlyRevenue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: BarChart(
            BarChartData(
              backgroundColor: Colors.transparent,
              alignment: BarChartAlignment.center,
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                drawHorizontalLine: false,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              groupsSpace: 10,
              barGroups: getData(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            width: 15,
            toY: 12000,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            width: 15,
            toY: 17000,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            width: 15,
            toY: 7000,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            width: 15,
            toY: 14000,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            width: 15,
            toY: 18000,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 6000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 30000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 7,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 12000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 8,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 12000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 9,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 12000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 10,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 12000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
      BarChartGroupData(
        x: 11,
        barsSpace: 10,
        barRods: [
          BarChartRodData(
            toY: 12000,
            width: 15,
            color: const Color(0xffFF8200),
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    ];
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Color(0xff939393), fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }
}
