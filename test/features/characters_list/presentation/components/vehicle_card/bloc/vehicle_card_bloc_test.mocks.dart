// Mocks generated by Mockito 5.4.2 from annotations
// in desafio_flutter_urbetrack/test/features/characters_list/presentation/components/vehicle_card/bloc/vehicle_card_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_input.dart'
    as _i5;
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/inputs_outputs/get_vehicle_by_id/get_vehicle_by_id_output.dart'
    as _i2;
import 'package:desafio_flutter_urbetrack/features/characters_list/domain/repositories/i_vehicle_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetVehicleByIdOutput_0 extends _i1.SmartFake
    implements _i2.GetVehicleByIdOutput {
  _FakeGetVehicleByIdOutput_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IVehicleRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIVehicleRepository extends _i1.Mock
    implements _i3.IVehicleRepository {
  MockIVehicleRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.GetVehicleByIdOutput> getVehicleById(
          _i5.GetVehicleByIdInput? input) =>
      (super.noSuchMethod(
        Invocation.method(
          #getVehicleById,
          [input],
        ),
        returnValue: _i4.Future<_i2.GetVehicleByIdOutput>.value(
            _FakeGetVehicleByIdOutput_0(
          this,
          Invocation.method(
            #getVehicleById,
            [input],
          ),
        )),
      ) as _i4.Future<_i2.GetVehicleByIdOutput>);
}
