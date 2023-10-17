// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'starship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Starship _$StarshipFromJson(Map<String, dynamic> json) {
  return _Starship.fromJson(json);
}

/// @nodoc
mixin _$Starship {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufacturer')
  String get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost_in_credits')
  String get costInCredits => throw _privateConstructorUsedError;
  @JsonKey(name: 'starship_class')
  String get starshipClass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StarshipCopyWith<Starship> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StarshipCopyWith<$Res> {
  factory $StarshipCopyWith(Starship value, $Res Function(Starship) then) =
      _$StarshipCopyWithImpl<$Res, Starship>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'model') String model,
      @JsonKey(name: 'manufacturer') String manufacturer,
      @JsonKey(name: 'cost_in_credits') String costInCredits,
      @JsonKey(name: 'starship_class') String starshipClass});
}

/// @nodoc
class _$StarshipCopyWithImpl<$Res, $Val extends Starship>
    implements $StarshipCopyWith<$Res> {
  _$StarshipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? manufacturer = null,
    Object? costInCredits = null,
    Object? starshipClass = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      costInCredits: null == costInCredits
          ? _value.costInCredits
          : costInCredits // ignore: cast_nullable_to_non_nullable
              as String,
      starshipClass: null == starshipClass
          ? _value.starshipClass
          : starshipClass // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StarshipImplCopyWith<$Res>
    implements $StarshipCopyWith<$Res> {
  factory _$$StarshipImplCopyWith(
          _$StarshipImpl value, $Res Function(_$StarshipImpl) then) =
      __$$StarshipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'model') String model,
      @JsonKey(name: 'manufacturer') String manufacturer,
      @JsonKey(name: 'cost_in_credits') String costInCredits,
      @JsonKey(name: 'starship_class') String starshipClass});
}

/// @nodoc
class __$$StarshipImplCopyWithImpl<$Res>
    extends _$StarshipCopyWithImpl<$Res, _$StarshipImpl>
    implements _$$StarshipImplCopyWith<$Res> {
  __$$StarshipImplCopyWithImpl(
      _$StarshipImpl _value, $Res Function(_$StarshipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? manufacturer = null,
    Object? costInCredits = null,
    Object? starshipClass = null,
  }) {
    return _then(_$StarshipImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      costInCredits: null == costInCredits
          ? _value.costInCredits
          : costInCredits // ignore: cast_nullable_to_non_nullable
              as String,
      starshipClass: null == starshipClass
          ? _value.starshipClass
          : starshipClass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StarshipImpl implements _Starship {
  const _$StarshipImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'model') required this.model,
      @JsonKey(name: 'manufacturer') required this.manufacturer,
      @JsonKey(name: 'cost_in_credits') required this.costInCredits,
      @JsonKey(name: 'starship_class') required this.starshipClass});

  factory _$StarshipImpl.fromJson(Map<String, dynamic> json) =>
      _$$StarshipImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'model')
  final String model;
  @override
  @JsonKey(name: 'manufacturer')
  final String manufacturer;
  @override
  @JsonKey(name: 'cost_in_credits')
  final String costInCredits;
  @override
  @JsonKey(name: 'starship_class')
  final String starshipClass;

  @override
  String toString() {
    return 'Starship(name: $name, model: $model, manufacturer: $manufacturer, costInCredits: $costInCredits, starshipClass: $starshipClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StarshipImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.costInCredits, costInCredits) ||
                other.costInCredits == costInCredits) &&
            (identical(other.starshipClass, starshipClass) ||
                other.starshipClass == starshipClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, model, manufacturer, costInCredits, starshipClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StarshipImplCopyWith<_$StarshipImpl> get copyWith =>
      __$$StarshipImplCopyWithImpl<_$StarshipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StarshipImplToJson(
      this,
    );
  }
}

abstract class _Starship implements Starship {
  const factory _Starship(
      {@JsonKey(name: 'name')
          required final String name,
      @JsonKey(name: 'model')
          required final String model,
      @JsonKey(name: 'manufacturer')
          required final String manufacturer,
      @JsonKey(name: 'cost_in_credits')
          required final String costInCredits,
      @JsonKey(name: 'starship_class')
          required final String starshipClass}) = _$StarshipImpl;

  factory _Starship.fromJson(Map<String, dynamic> json) =
      _$StarshipImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'model')
  String get model;
  @override
  @JsonKey(name: 'manufacturer')
  String get manufacturer;
  @override
  @JsonKey(name: 'cost_in_credits')
  String get costInCredits;
  @override
  @JsonKey(name: 'starship_class')
  String get starshipClass;
  @override
  @JsonKey(ignore: true)
  _$$StarshipImplCopyWith<_$StarshipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
