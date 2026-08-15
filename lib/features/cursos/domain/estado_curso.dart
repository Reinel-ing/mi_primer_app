import 'package:mi_primer_app/core/json.dart';

sealed class EstadoCurso {
  const EstadoCurso();

  factory EstadoCurso.fromJson(Map<String, dynamic> json) {
    final tipo = leerTexto(json, 'tipo');
    return switch (tipo) {
      'planificado' => const Planificado(),
      'inscripciones_abiertas' => InscripcionesAbiertas(
        leerEntero(json, 'cupoDisponible'),
      ),
      'en_curso' => EnCurso(leerFecha(json, 'fechaInicio')),
      'finalizado' => Finalizado(leerFecha(json, 'fechaFin')),
      'cancelado' => Cancelado(leerTexto(json, 'motivo')),
      _ => throw CampoInvalido('estado.tipo', 'no es un estado conocido', tipo),
    };
  }

  Map<String, dynamic> toJson() => switch (this) {
    Planificado() => {'tipo': 'planificado'},
    InscripcionesAbiertas(:final cupoDisponible) => {
      'tipo': 'inscripciones_abiertas',
      'cupoDisponible': cupoDisponible,
    },
    EnCurso(:final fechaInicio) => {
      'tipo': 'en_curso',
      'fechaInicio': fechaInicio.toIso8601String(),
    },
    Finalizado(:final fechaFin) => {
      'tipo': 'finalizado',
      'fechaFin': fechaFin.toIso8601String(),
    },
    Cancelado(:final motivo) => {'tipo': 'cancelado', 'motivo': motivo},
  };

  bool get sePuedeEditar => switch (this) {
    Planificado() || InscripcionesAbiertas() => true,
    EnCurso() || Finalizado() || Cancelado() => false,
  };

  String get etiqueta => switch (this) {
    Planificado() => 'Planificado',
    InscripcionesAbiertas(:final cupoDisponible) =>
      'Inscripciones abiertas · $cupoDisponible cupos',
    EnCurso() => 'En curso',
    Finalizado() => 'Finalizado',
    Cancelado(:final motivo) => 'Cancelado: $motivo',
  };
}

final class Planificado extends EstadoCurso {
  const Planificado();

  @override
  bool operator ==(Object other) => other is Planificado;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => 'Planificado()';
}

final class InscripcionesAbiertas extends EstadoCurso {
  const InscripcionesAbiertas(this.cupoDisponible);

  final int cupoDisponible;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InscripcionesAbiertas && other.cupoDisponible == cupoDisponible;

  @override
  int get hashCode => Object.hash(runtimeType, cupoDisponible);

  @override
  String toString() => 'InscripcionesAbiertas($cupoDisponible)';
}

final class EnCurso extends EstadoCurso {
  const EnCurso(this.fechaInicio);

  final DateTime fechaInicio;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnCurso && other.fechaInicio == fechaInicio;

  @override
  int get hashCode => Object.hash(runtimeType, fechaInicio);

  @override
  String toString() => 'EnCurso($fechaInicio)';
}

final class Finalizado extends EstadoCurso {
  const Finalizado(this.fechaFin);

  final DateTime fechaFin;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Finalizado && other.fechaFin == fechaFin;

  @override
  int get hashCode => Object.hash(runtimeType, fechaFin);

  @override
  String toString() => 'Finalizado($fechaFin)';
}

final class Cancelado extends EstadoCurso {
  const Cancelado(this.motivo) : assert(motivo != '', 'cancelar exige motivo');

  final String motivo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Cancelado && other.motivo == motivo;

  @override
  int get hashCode => Object.hash(runtimeType, motivo);

  @override
  String toString() => 'Cancelado($motivo)';
}
