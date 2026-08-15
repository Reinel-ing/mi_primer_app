# EduCampus — Laboratorio E02 (Flutter, Desarrollo Móvil)

Aplicación móvil para la gestión y consulta de cursos académicos. Permite ver
la lista de cursos disponibles, su docente, horario, estado de inscripción y
disponibilidad de cupos, cargados desde un JSON local.

## El dominio

- `Curso` — entidad principal. Identidad: `id`.
- `Horario` — objeto de valor (día, hora de inicio, hora de fin).
- `EstadoCurso` — clase sellada con 5 estados:
  - `Planificado` — sin dato extra.
  - `InscripcionesAbiertas(cupoDisponible)`.
  - `EnCurso(fechaInicio)`.
  - `Finalizado(fechaFin)`.
  - `Cancelado(motivo)` — el motivo es obligatorio, no se puede cancelar sin él.

**Decisión sobre freezed:** `Curso` está generado con freezed
(`==`, `hashCode`, `copyWith`, `toString`), pero con
`@Freezed(fromJson: false, toJson: false)` para mantener `fromJson`/`toJson`
escritos a mano. La razón: el `fromJson` manual usa los lectores de
`core/json.dart` (`leerTexto`, `leerFecha`, etc.), que lanzan `CampoInvalido`
con el nombre exacto del campo que falló; el generado automáticamente solo
da `type 'Null' is not a subtype of type 'String'`, sin decir cuál campo.
`Horario` y `EstadoCurso` siguen escritos 100% a mano, sin generador.

Se conserva `curso_manual.dart.bak` con la versión de `Curso` escrita
íntegramente a mano, para comparar.

## Arquitectura

- `lib/main.dart` — pantalla que lista los cursos.
- `lib/core/json.dart` — lectores defensivos de JSON (`CampoInvalido`).
- `lib/core/comparaciones.dart` — comparación de listas por contenido.
- `lib/features/cursos/domain/` — entidad, valor, estados, interfaz. Sin Flutter.
  - `curso.dart`, `curso.freezed.dart` (generado)
  - `horario.dart`
  - `estado_curso.dart`
  - `cursos_repository.dart` (interfaz)
- `lib/features/cursos/data/cursos_locales.dart` — implementación con `rootBundle`.
- `lib/features/cursos/presentation/` — sin uso todavía.
- `assets/data/cursos.json` — 3 cursos de ejemplo.

## Cómo correrlo

​```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
​```

## Testing

18 pruebas en total:

​```bash
flutter test                       # todas
flutter test test/domain/          # solo el dominio
flutter test --reporter expanded   # ver cada nombre de prueba
​```

## Datos de ejemplo

`assets/data/cursos.json` trae 3 registros, cada uno pensado para forzar un
caso distinto: un campo opcional ausente, un estado con dato obligatorio,
y el caso completo.

## Requisitos

- Flutter SDK stable
- Dart 3.x (null safety, sealed classes)
