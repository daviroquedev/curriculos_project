import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SituacaoChart extends StatelessWidget {
  final List<Map<String, dynamic>> candidatos;

  SituacaoChart({required this.candidatos});

  @override
  Widget build(BuildContext context) {
    Map<String, int> situacaoDistribution = {};
    for (var candidato in candidatos) {
      var situacao = candidato['statusSolicitacao'];
      situacaoDistribution[situacao] =
          (situacaoDistribution[situacao] ?? 0) + 1;
    }

    Map<String, Color> coresSituacoes = {
      'APROVADO': Colors.green,
      'PENDENTE': Colors.yellow,
      'REPROVADO': Colors.red,
    };

    return Column(
      children: [
        const Text('Gráfico de Distribuição da Situação dos Candidatos'),
        SizedBox(
          width: 300,
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: situacaoDistribution.entries.map((entry) {
                var situacao = entry.key;
                return PieChartSectionData(
                  color: coresSituacoes.containsKey(situacao)
                      ? coresSituacoes[situacao]
                      : Colors.grey,
                  value: entry.value.toDouble(),
                  title: situacao,
                  radius: 50,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
