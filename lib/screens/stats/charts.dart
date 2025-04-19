import 'package:expense_tracker/data/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
      swapAnimationDuration: const Duration(milliseconds: 500), // Animación suave
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16, // Ancho aumentado para mejor visibilidad
          gradient: LinearGradient(
            colors: [
              AppColors.barChartColor1,
              AppColors.barChartColor2,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(4),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          default:
            return makeGroupData(i, 0); // Mejor manejo de casos no especificados
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getTiles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
      alignment: BarChartAlignment.spaceAround,
      maxY: 6, // Establece un máximo para el eje Y
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );
    
    String text;
    switch (value.toInt()) {
      case 0: text = 'Lun'; break;
      case 1: text = 'Mar'; break;
      case 2: text = 'Mié'; break;
      case 3: text = 'Jue'; break;
      case 4: text = 'Vie'; break;
      case 5: text = 'Sáb'; break;
      case 6: text = 'Dom'; break;
      default: text = ''; break;
    }
    
    return SideTitleWidget(
      meta: meta,
      space: 16,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value >= 6) return const SizedBox(); // Oculta valores superiores al máximo
    
    const style = TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 1) {
      text = '1k';
    } else if (value == 2) {
      text = '2k';
    } else if (value == 3) {
      text = '3k';
    } else if (value == 4) {
      text = '4k';
    } else if (value == 5) {
      text = '5k';
    } else {
      return Container();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: style),
    );
  }
}