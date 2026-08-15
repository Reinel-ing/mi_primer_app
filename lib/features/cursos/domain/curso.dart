import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/cursos/domain/estado_curso.dart';
import 'package:mi_primer_app/features/cursos/domain/horario.dart';

part 'curso.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class Curso with _$Curso {
  const factory Curso({
    required String id,
    required String nombre,
    required String docente,
    required Horario horario,
    required EstadoCurso estado,
    String? aula,
  }) = _Curso;

  const Curso._();

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
    id: leerTexto(json, 'id'),
    nombre: leerTexto(json, 'nombre'),
    docente: leerTexto(json, 'docente'),
    horario: Horario.fromJson(leerMapa(json, 'horario')),
    estado: EstadoCurso.fromJson(leerMapa(json, 'estado')),
    aula: leerTextoOpcional(json, 'aula'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'docente': docente,
    'horario': horario.toJson(),
    'estado': estado.toJson(),
    if (aula != null) 'aula': aula,
  };

  bool get sePuedeEditar => estado.sePuedeEditar;

  bool get tieneAulaAsignada => aula != null;

  bool get sePuedeInscribir {
    final estadoActual = estado;
    return estadoActual is InscripcionesAbiertas &&
        estadoActual.cupoDisponible > 0;
  }

  int diasEnCurso(DateTime ahora) {
    final estadoActual = estado;
    if (estadoActual is! EnCurso) return 0;
    return ahora.difference(estadoActual.fechaInicio).inDays;
  }
}
