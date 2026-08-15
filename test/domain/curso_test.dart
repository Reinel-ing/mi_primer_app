import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/cursos/domain/curso.dart';
import 'package:mi_primer_app/features/cursos/domain/estado_curso.dart';
import 'package:mi_primer_app/features/cursos/domain/horario.dart';

Curso ejemplo({EstadoCurso? estado, Horario? horario}) => Curso(
  id: 'cur-001',
  nombre: 'Calculo I',
  docente: 'Carlos Perez',
  horario:
      horario ??
      const Horario(dia: 'Lunes', horaInicio: '08:00', horaFin: '10:00'),
  estado: estado ?? const Planificado(),
);

void main() {
  group('serialización', () {
    test('un curso sobrevive la ida y vuelta a JSON sin perder nada', () {
      final original = ejemplo(estado: const InscripcionesAbiertas(15));

      final texto = jsonEncode(original.toJson());
      final vuelta = Curso.fromJson(jsonDecode(texto) as Map<String, dynamic>);

      expect(vuelta, equals(original));
    });

    test('un curso Planificado, sin datos extra en el estado, se lee bien', () {
      final json = ejemplo(estado: const Planificado()).toJson();
      final curso = Curso.fromJson(json);

      expect(curso.estado, isA<Planificado>());
    });

    test('un curso sin nombre dice QUÉ campo falló, no solo que falló', () {
      final json = ejemplo().toJson()..remove('nombre');

      expect(
        () => Curso.fromJson(json),
        throwsA(isA<CampoInvalido>().having((e) => e.campo, 'campo', 'nombre')),
      );
    });

    test('una fechaInicio que no es ISO 8601 se rechaza', () {
      final json = ejemplo(estado: EnCurso(DateTime.utc(2026, 8, 1))).toJson();
      (json['estado'] as Map<String, dynamic>)['fechaInicio'] = '1 de agosto';

      expect(() => Curso.fromJson(json), throwsA(isA<CampoInvalido>()));
    });

    test('un tipo de estado desconocido se rechaza', () {
      final json = ejemplo().toJson();
      (json['estado'] as Map<String, dynamic>)['tipo'] = 'suspendido';

      expect(() => Curso.fromJson(json), throwsA(isA<CampoInvalido>()));
    });
  });

  group('igualdad y copia', () {
    test('dos cursos con los mismos datos son iguales', () {
      expect(ejemplo(), equals(ejemplo()));
    });

    test('dos cursos con los mismos datos comparten hashCode', () {
      expect(ejemplo().hashCode, equals(ejemplo().hashCode));
      expect({ejemplo(), ejemplo()}.length, 1);
    });

    test('dos cursos con horarios distintos NO son iguales', () {
      final cursoA = ejemplo(
        horario: const Horario(
          dia: 'Lunes',
          horaInicio: '08:00',
          horaFin: '10:00',
        ),
      );
      final cursoB = ejemplo(
        horario: const Horario(
          dia: 'Miercoles',
          horaInicio: '08:00',
          horaFin: '10:00',
        ),
      );

      expect(cursoA, isNot(equals(cursoB)));
    });

    test('copyWith cambia solo lo que se le pasa y conserva el id', () {
      final original = ejemplo();
      final copia = original.copyWith(nombre: 'Calculo II');

      expect(copia.nombre, 'Calculo II');
      expect(copia.id, original.id);
      expect(copia.docente, original.docente);
    });
  });

  group('reglas de negocio', () {
    test(
      'un curso con inscripciones abiertas y cupo disponible se puede inscribir',
      () {
        expect(
          ejemplo(estado: const InscripcionesAbiertas(5)).sePuedeInscribir,
          isTrue,
        );
      },
    );

    test(
      'un curso con inscripciones abiertas pero sin cupo NO se puede inscribir',
      () {
        expect(
          ejemplo(estado: const InscripcionesAbiertas(0)).sePuedeInscribir,
          isFalse,
        );
      },
    );

    test('un curso cancelado no se puede editar; uno planificado sí', () {
      expect(
        ejemplo(estado: const Cancelado('Falta cupo minimo')).sePuedeEditar,
        isFalse,
      );
      expect(ejemplo(estado: const Planificado()).sePuedeEditar, isTrue);
    });

    test(
      'diasEnCurso calcula los días desde fechaInicio, y es 0 si no está en curso',
      () {
        final curso = ejemplo(estado: EnCurso(DateTime.utc(2026, 8, 1)));
        final ahora = DateTime.utc(2026, 8, 11);

        expect(curso.diasEnCurso(ahora), 10);
        expect(ejemplo(estado: const Planificado()).diasEnCurso(ahora), 0);
      },
    );
  });
}
