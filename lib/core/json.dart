class CampoInvalido implements Exception {
  const CampoInvalido(this.campo, this.motivo, this.valor);

  final String campo;
  final String motivo;
  final Object? valor;

  @override
  String toString() => "CampoInvalido: '$campo' $motivo (llego: $valor)";
}

String leerTexto(Map<String, dynamic> json, String campo) {
  final valor = json[campo];
  if (valor is String && valor.trim().isNotEmpty) return valor;
  throw CampoInvalido(campo, 'debe ser un texto no vacio', valor);
}

String? leerTextoOpcional(Map<String, dynamic> json, String campo) {
  final valor = json[campo];
  if (valor == null) return null;
  if (valor is String) return valor;
  throw CampoInvalido(campo, 'debe ser un texto o venir ausente', valor);
}

int leerEntero(Map<String, dynamic> json, String campo) {
  final valor = json[campo];
  if (valor is int) return valor;
  throw CampoInvalido(campo, 'debe ser un numero entero', valor);
}

DateTime leerFecha(Map<String, dynamic> json, String campo) {
  final valor = json[campo];
  if (valor is! String) {
    throw CampoInvalido(campo, 'debe ser una fecha ISO 8601 en texto', valor);
  }
  final fecha = DateTime.tryParse(valor);
  if (fecha == null) {
    throw CampoInvalido(campo, 'no es una fecha ISO 8601', valor);
  }
  return fecha.toUtc();
}

Map<String, dynamic> leerMapa(Map<String, dynamic> json, String campo) {
  final valor = json[campo];
  if (valor is Map<String, dynamic>) return valor;
  throw CampoInvalido(campo, 'debe ser un objeto', valor);
}
