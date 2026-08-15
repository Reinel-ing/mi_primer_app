import 'package:mi_primer_app/features/cursos/domain/curso.dart';

abstract interface class CursosRepository {
  Future<List<Curso>> obtenerTodos();

  Future<Curso?> obtenerPorId(String id);
}
