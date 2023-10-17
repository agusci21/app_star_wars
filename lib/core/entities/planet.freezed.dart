// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'planet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  return _Planet.fromJson(json);
}

/// @nodoc
mixin _$Planet {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rotation_period')
  String get rotationPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'orbital_period')
  String get orbitalPeriod => throw _privateConstructorUsedError;
  String get population => throw _privateConstructorUsedError;
  @JsonKey(name: 'surface_water')
  String get surfaceWater => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanetCopyWith<Planet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanetCopyWith<$Res> {
  factory $PlanetCopyWith(Planet value, $Res Function(Planet) then) =
      _$PlanetCopyWithImpl<$Res, Planet>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'rotation_period') String rotationPeriod,
      @JsonKey(name: 'orbital_period') String orbitalPeriod,
      String population,
      @JsonKey(name: 'surface_water') String surfaceWater});
}

/// @nodoc
class _$PlanetCopyWithImpl<$Res, $Val extends Planet>
    implements $PlanetCopyWith<$Res> {
  _$PlanetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rotationPeriod = null,
    Object? orbitalPeriod = null,
    Object? population = null,
    Object? surfaceWater = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rotationPeriod: null == rotationPeriod
          ? _value.rotationPeriod
          : rotationPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      orbitalPeriod: null == orbitalPeriod
          ? _value.orbitalPeriod
          : orbitalPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as String,
      surfaceWater: null == surfaceWater
          ? _value.surfaceWater
          : surfaceWater // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanetImplCopyWith<$Res> implements $PlanetCopyWith<$Res> {
  factory _$$PlanetImplCopyWith(
          _$PlanetImpl value, $Res Function(_$PlanetImpl) then) =
      __$$PlanetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'rotation_period') String rotationPeriod,
      @JsonKey(name: 'orbital_period') String orbitalPeriod,
      String population,
      @JsonKey(name: 'surface_water') String surfaceWater});
}

/// @nodoc
class __$$PlanetImplCopyWithImpl<$Res>
    extends _$PlanetCopyWithImpl<$Res, _$PlanetImpl>
    implements _$$PlanetImplCopyWith<$Res> {
  __$$PlanetImplCopyWithImpl(
      _$PlanetImpl _value, $Res Function(_$PlanetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rotationPeriod = null,
    Object? orbitalPeriod = null,
    Object? population = null,
    Object? surfaceWater = null,
  }) {
    return _then(_$PlanetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rotationPeriod: null == rotationPeriod
          ? _value.rotationPeriod
          : rotationPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      orbitalPeriod: null == orbitalPeriod
          ? _value.orbitalPeriod
          : orbitalPeriod // ignore: cast_nullable_to_non_nullable
              as String,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as String,
      surfaceWater: null == surfaceWater
          ? _value.surfaceWater
          : surfaceWater // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanetImpl implements _Planet {
  const _$PlanetImpl(
      {required this.name,
      @JsonKey(name: 'rotation_period') required this.rotationPeriod,
      @JsonKey(name: 'orbital_period') required this.orbitalPeriod,
      required this.population,
      @JsonKey(name: 'surface_water') required this.surfaceWater});

  factory _$PlanetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanetImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'rotation_period')
  final String rotationPeriod;
  @override
  @JsonKey(name: 'orbital_period')
  final String orbitalPeriod;
  @override
  final String population;
  @override
  @JsonKey(name: 'surface_water')
  final String surfaceWater;

  @override
  String toString() {
    return 'Planet(name: $name, rotationPeriod: $rotationPeriod, orbitalPeriod: $orbitalPeriod, population: $population, surfaceWater: $surfaceWater)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanetImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rotationPeriod, rotationPeriod) ||
                other.rotationPeriod == rotationPeriod) &&
            (identical(other.orbitalPeriod, orbitalPeriod) ||
                other.orbitalPeriod == orbitalPeriod) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.surfaceWater, surfaceWater) ||
                other.surfaceWater == surfaceWater));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, rotationPeriod,
      orbitalPeriod, population, surfaceWater);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      __$$PlanetImplCopyWithImpl<_$PlanetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanetImplToJson(
      this,
    );
  }
}

abstract class _Planet implements Planet {
  const factory _Planet(
      {required final String name,
      @JsonKey(name: 'rotation_period')
          required final String rotationPeriod,
      @JsonKey(name: 'orbital_period')
          required final String orbitalPeriod,
      required final String population,
      @JsonKey(name: 'surface_water')
          required final String surfaceWater}) = _$PlanetImpl;

  factory _Planet.fromJson(Map<String, dynamic> json) = _$PlanetImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'rotation_period')
  String get rotationPeriod;
  @override
  @JsonKey(name: 'orbital_period')
  String get orbitalPeriod;
  @override
  String get population;
  @override
  @JsonKey(name: 'surface_water')
  String get surfaceWater;
  @override
  @JsonKey(ignore: true)
  _$$PlanetImplCopyWith<_$PlanetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
