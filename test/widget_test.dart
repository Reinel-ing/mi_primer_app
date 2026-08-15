import 'package:flutter_test/flutter_test.dart';
import 'package:mi_primer_app/main.dart';

void main() {
  testWidgets('la pantalla de cursos muestra los tres cursos del JSON', (
    tester,
  ) async {
    await tester.pumpWidget(const MiApp());
    await tester.pumpAndSettle();

    expect(find.text('Calculo I'), findsOneWidget);
    expect(find.text('Fisica General'), findsOneWidget);
    expect(find.text('Programacion Python'), findsOneWidget);
  });
}
