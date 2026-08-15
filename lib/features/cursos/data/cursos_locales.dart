import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/cursos/domain/curso.dart';
import 'package:mi_primer_app/features/cursos/domain/cursos_repository.dart';

typedef LectorDeAssets = Future<String> Function(String ruta);

class CursosLocales implements CursosRepository {
  CursosLocales({LectorDeAssets? lector, this.ruta = 'assets/data/cursos.json'})
    : _lector = lector ?? rootBundle.loadString;

  final LectorDeAssets _lector;
  final String ruta;

  List<Curso>? _cache;

  @override
  Future<List<Curso>> obtenerTodos() async {
    final guardado = _cache;
    if (guardado != null) return guardado;

    final crudo = await _lector(ruta);
    final decodificado = jsonDecode(crudo);

    if (decodificado is! List) {
      throw const CampoInvalido(
        '(raíz)',
        'el archivo debe contener una lista',
        null,
      );
    }

    return _cache = decodificado
        .map((e) => Curso.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<Curso?> obtenerPorId(String id) async {
    for (final curso in await obtenerTodos()) {
      if (curso.id == id) return curso;
    }
    return null;
  }
}
