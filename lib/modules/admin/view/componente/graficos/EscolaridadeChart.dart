import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EscolaridadeChart extends StatelessWidget {
  final List<Map<String, dynamic>> candidatos;

  EscolaridadeChart({required this.candidatos});

  @override
  Widget build(BuildContext context) {
    Map<String, int> escolaridadeDistribution = {};

    for (var candidato in candidatos) {
      var escolaridade = candidato['escolaridade'];
      escolaridadeDistribution[escolaridade] =
          (escolaridadeDistribution[escolaridade] ?? 0) + 1;
    }

    List<BarChartGroupData> barGroups = [];
    List<String> escolaridades = escolaridadeDistribution.keys.toList();
    escolaridades.asMap().forEach((index, escolaridade) {
      barGroups.add(
        BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: escolaridadeDistribution[escolaridade]!.toDouble(),
              color: Colors.black,
            ),
          ],
        ),
      );
    });

    // Create a map that maps each bar to a route
    Map<int, String> barToRouteMap = {
      0: '/route1',
      1: '/route2',
      2: '/route3',
      3: '/route4',
      // Add more entries for each bar
    };

    return Column(
      children: [
        const Text('Gráfico de Distribuição de Escolaridade'),
        SizedBox(
          width: 300,
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: escolaridadeDistribution.values
                  .reduce((curr, next) => curr > next ? curr : next)
                  .toDouble(),
              barTouchData: BarTouchData(
                enabled: true,
                touchCallback:
                    (FlTouchEvent event, BarTouchResponse? touchResponse) {
                  if (touchResponse != null && touchResponse.spot != null) {
                    int barIndex = touchResponse.spot!.touchedBarGroupIndex;
                    String route = barToRouteMap[barIndex]!;
                    print(barIndex);
                    print(route);
                    // Modular.to.navigate("/");
                  }
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= 0 &&
                          value.toInt() < escolaridades.length) {
                        String titulo = escolaridades[value.toInt()];
                        titulo = titulo.substring(0, 3);
                        return Text(
                          titulo,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: true)),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: barGroups,
            ),
          ),
        ),
      ],
    );
  }
}
