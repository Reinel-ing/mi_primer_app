// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curso.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Curso {

 String get id; String get nombre; String get docente; Horario get horario; EstadoCurso get estado;
/// Create a copy of Curso
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CursoCopyWith<Curso> get copyWith => _$CursoCopyWithImpl<Curso>(this as Curso, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Curso&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.docente, docente) || other.docente == docente)&&(identical(other.horario, horario) || other.horario == horario)&&(identical(other.estado, estado) || other.estado == estado));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,docente,horario,estado);

@override
String toString() {
  return 'Curso(id: $id, nombre: $nombre, docente: $docente, horario: $horario, estado: $estado)';
}


}

/// @nodoc
abstract mixin class $CursoCopyWith<$Res>  {
  factory $CursoCopyWith(Curso value, $Res Function(Curso) _then) = _$CursoCopyWithImpl;
@useResult
$Res call({
 String id, String nombre, String docente, Horario horario, EstadoCurso estado
});




}
/// @nodoc
class _$CursoCopyWithImpl<$Res>
    implements $CursoCopyWith<$Res> {
  _$CursoCopyWithImpl(this._self, this._then);

  final Curso _self;
  final $Res Function(Curso) _then;

/// Create a copy of Curso
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nombre = null,Object? docente = null,Object? horario = null,Object? estado = null,}) {
  return _then(Curso(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,docente: null == docente ? _self.docente : docente // ignore: cast_nullable_to_non_nullable
as String,horario: null == horario ? _self.horario : horario // ignore: cast_nullable_to_non_nullable
as Horario,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoCurso,
  ));
}

}


/// Adds pattern-matching-related methods to [Curso].
extension CursoPatterns on Curso {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Curso value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Curso() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Curso value)  $default,){
final _that = this;
switch (_that) {
case _Curso():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Curso value)?  $default,){
final _that = this;
switch (_that) {
case _Curso() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nombre,  String docente,  Horario horario,  EstadoCurso estado)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Curso() when $default != null:
return $default(_that.id,_that.nombre,_that.docente,_that.horario,_that.estado);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nombre,  String docente,  Horario horario,  EstadoCurso estado)  $default,) {final _that = this;
switch (_that) {
case _Curso():
return $default(_that.id,_that.nombre,_that.docente,_that.horario,_that.estado);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nombre,  String docente,  Horario horario,  EstadoCurso estado)?  $default,) {final _that = this;
switch (_that) {
case _Curso() when $default != null:
return $default(_that.id,_that.nombre,_that.docente,_that.horario,_that.estado);case _:
  return null;

}
}

}

/// @nodoc


class _Curso extends Curso {
  const _Curso({required this.id, required this.nombre, required this.docente, required this.horario, required this.estado}): super._();
  

@override final  String id;
@override final  String nombre;
@override final  String docente;
@override final  Horario horario;
@override final  EstadoCurso estado;

/// Create a copy of Curso
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CursoCopyWith<_Curso> get copyWith => __$CursoCopyWithImpl<_Curso>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Curso&&(identical(other.id, id) || other.id == id)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.docente, docente) || other.docente == docente)&&(identical(other.horario, horario) || other.horario == horario)&&(identical(other.estado, estado) || other.estado == estado));
}


@override
int get hashCode => Object.hash(runtimeType,id,nombre,docente,horario,estado);

@override
String toString() {
  return 'Curso(id: $id, nombre: $nombre, docente: $docente, horario: $horario, estado: $estado)';
}


}

/// @nodoc
abstract mixin class _$CursoCopyWith<$Res> implements $CursoCopyWith<$Res> {
  factory _$CursoCopyWith(_Curso value, $Res Function(_Curso) _then) = __$CursoCopyWithImpl;
@override @useResult
$Res call({
 String id, String nombre, String docente, Horario horario, EstadoCurso estado
});




}
/// @nodoc
class __$CursoCopyWithImpl<$Res>
    implements _$CursoCopyWith<$Res> {
  __$CursoCopyWithImpl(this._self, this._then);

  final _Curso _self;
  final $Res Function(_Curso) _then;

/// Create a copy of Curso
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nombre = null,Object? docente = null,Object? horario = null,Object? estado = null,}) {
  return _then(_Curso(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nombre: null == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String,docente: null == docente ? _self.docente : docente // ignore: cast_nullable_to_non_nullable
as String,horario: null == horario ? _self.horario : horario // ignore: cast_nullable_to_non_nullable
as Horario,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as EstadoCurso,
  ));
}


}

// dart format on
