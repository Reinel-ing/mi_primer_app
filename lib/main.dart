import 'package:flutter/material.dart';
import 'package:mi_primer_app/features/cursos/data/cursos_locales.dart';
import 'package:mi_primer_app/features/cursos/domain/curso.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'EduCampus',
    theme: ThemeData(colorSchemeSeed: Colors.indigo),
    home: const PantallaCursos(),
  );
}

class PantallaCursos extends StatefulWidget {
  const PantallaCursos({super.key});

  @override
  State<PantallaCursos> createState() => _PantallaCursosState();
}

class _PantallaCursosState extends State<PantallaCursos> {
  late final Future<List<Curso>> _cursos = CursosLocales().obtenerTodos();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('EduCampus · Cursos')),
    body: FutureBuilder<List<Curso>>(
      future: _cursos,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('No se pudo leer:\n${snapshot.error}'));
        }

        final cursos = snapshot.data ?? const <Curso>[];
        return ListView.separated(
          itemCount: cursos.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (context, i) {
            final curso = cursos[i];
            return ListTile(
              title: Text(curso.nombre),
              subtitle: Text('${curso.docente} · ${curso.estado.etiqueta}'),
              trailing: curso.sePuedeInscribir
                  ? const Icon(Icons.how_to_reg_outlined)
                  : null,
            );
          },
        );
      },
    ),
  );
}
