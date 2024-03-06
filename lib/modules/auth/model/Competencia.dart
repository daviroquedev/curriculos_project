class Competencia {
  String competencia;
  int nivelProficiencia;

  Competencia({
    required this.competencia,
    required this.nivelProficiencia,
  });

  Map<String, dynamic> toJson() {
    return {
      'competencia': competencia,
      'nivel_proficiencia': nivelProficiencia,
    };
  }
}
