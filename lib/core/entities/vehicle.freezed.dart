// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufacturer')
  String get manufacturer => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost_in_credits')
  String get costInCredits => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_class')
  String get vehicleClass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'manufacturer') String manufacturer,
      @JsonKey(name: 'cost_in_credits') String costInCredits,
      @JsonKey(name: 'vehicle_class') String vehicleClass});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? manufacturer = null,
    Object? costInCredits = null,
    Object? vehicleClass = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      costInCredits: null == costInCredits
          ? _value.costInCredits
          : costInCredits // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleClass: null == vehicleClass
          ? _value.vehicleClass
          : vehicleClass // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'manufacturer') String manufacturer,
      @JsonKey(name: 'cost_in_credits') String costInCredits,
      @JsonKey(name: 'vehicle_class') String vehicleClass});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? manufacturer = null,
    Object? costInCredits = null,
    Object? vehicleClass = null,
  }) {
    return _then(_$VehicleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      costInCredits: null == costInCredits
          ? _value.costInCredits
          : costInCredits // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleClass: null == vehicleClass
          ? _value.vehicleClass
          : vehicleClass // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl implements _Vehicle {
  const _$VehicleImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'manufacturer') required this.manufacturer,
      @JsonKey(name: 'cost_in_credits') required this.costInCredits,
      @JsonKey(name: 'vehicle_class') required this.vehicleClass});

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'manufacturer')
  final String manufacturer;
  @override
  @JsonKey(name: 'cost_in_credits')
  final String costInCredits;
  @override
  @JsonKey(name: 'vehicle_class')
  final String vehicleClass;

  @override
  String toString() {
    return 'Vehicle(name: $name, manufacturer: $manufacturer, costInCredits: $costInCredits, vehicleClass: $vehicleClass)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.costInCredits, costInCredits) ||
                other.costInCredits == costInCredits) &&
            (identical(other.vehicleClass, vehicleClass) ||
                other.vehicleClass == vehicleClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, manufacturer, costInCredits, vehicleClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'manufacturer') required final String manufacturer,
          @JsonKey(name: 'cost_in_credits') required final String costInCredits,
          @JsonKey(name: 'vehicle_class') required final String vehicleClass}) =
      _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'manufacturer')
  String get manufacturer;
  @override
  @JsonKey(name: 'cost_in_credits')
  String get costInCredits;
  @override
  @JsonKey(name: 'vehicle_class')
  String get vehicleClass;
  @override
  @JsonKey(ignore: true)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
