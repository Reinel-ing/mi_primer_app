import 'package:mi_primer_app/core/json.dart';

class Horario {
  const Horario({
    required this.dia,
    required this.horaInicio,
    required this.horaFin,
  });

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
    dia: leerTexto(json, 'dia'),
    horaInicio: leerTexto(json, 'horaInicio'),
    horaFin: leerTexto(json, 'horaFin'),
  );

  final String dia;
  final String horaInicio;
  final String horaFin;

  Map<String, dynamic> toJson() => {
    'dia': dia,
    'horaInicio': horaInicio,
    'horaFin': horaFin,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Horario &&
          other.dia == dia &&
          other.horaInicio == horaInicio &&
          other.horaFin == horaFin;

  @override
  int get hashCode => Object.hash(dia, horaInicio, horaFin);

  @override
  String toString() => 'Horario($dia, $horaInicio-$horaFin)';
}
