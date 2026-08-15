import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/core/json.dart';
import 'package:mi_primer_app/features/cursos/data/cursos_locales.dart';

const _json = '''
[
  {
    "id": "cur-001",
    "nombre": "Calculo I",
    "docente": "Carlos Perez",
    "horario": { "dia": "Lunes", "horaInicio": "08:00", "horaFin": "10:00" },
    "estado": { "tipo": "planificado" }
  }
]
''';

void main() {
  test('lee la lista completa del archivo', () async {
    final repo = CursosLocales(lector: (_) async => _json);
    expect((await repo.obtenerTodos()).length, 1);
  });

  test('busca por id y devuelve null cuando no está', () async {
    final repo = CursosLocales(lector: (_) async => _json);

    expect((await repo.obtenerPorId('cur-001'))?.nombre, 'Calculo I');
    expect(await repo.obtenerPorId('no-existe'), isNull);
  });

  test('un archivo que no es una lista se rechaza', () async {
    final repo = CursosLocales(lector: (_) async => '{"a": 1}');
    expect(repo.obtenerTodos(), throwsA(isA<CampoInvalido>()));
  });

  test(
    'el asset declarado en pubspec existe y el modelo lo entiende',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final repo = CursosLocales(lector: rootBundle.loadString);
      expect((await repo.obtenerTodos()).length, greaterThanOrEqualTo(3));
    },
  );
}
