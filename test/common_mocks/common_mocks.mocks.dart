// Mocks generated by Mockito 5.4.2 from annotations
// in desafio_flutter_urbetrack/test/common_mocks/common_mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:desafio_flutter_urbetrack/abstractions/i_http_helper.dart'
    as _i2;
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

class _FakeHttpResponse_0<T1> extends _i1.SmartFake
    implements _i2.HttpResponse<T1> {
  _FakeHttpResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IHttpHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockIHttpHelper extends _i1.Mock implements _i2.IHttpHelper {
  MockIHttpHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.HttpResponse<T>> post<T>(
    String? path, {
    dynamic data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [path],
          {#data: data},
        ),
        returnValue:
            _i3.Future<_i2.HttpResponse<T>>.value(_FakeHttpResponse_0<T>(
          this,
          Invocation.method(
            #post,
            [path],
            {#data: data},
          ),
        )),
      ) as _i3.Future<_i2.HttpResponse<T>>);

  @override
  _i3.Future<_i2.HttpResponse<T>> put<T>(
    String? path, {
    dynamic data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [path],
          {#data: data},
        ),
        returnValue:
            _i3.Future<_i2.HttpResponse<T>>.value(_FakeHttpResponse_0<T>(
          this,
          Invocation.method(
            #put,
            [path],
            {#data: data},
          ),
        )),
      ) as _i3.Future<_i2.HttpResponse<T>>);

  @override
  _i3.Future<_i2.HttpResponse<T>> get<T>(
    String? url, {
    Map<String, dynamic>? query,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#query: query},
        ),
        returnValue:
            _i3.Future<_i2.HttpResponse<T>>.value(_FakeHttpResponse_0<T>(
          this,
          Invocation.method(
            #get,
            [url],
            {#query: query},
          ),
        )),
      ) as _i3.Future<_i2.HttpResponse<T>>);

  @override
  _i3.Future<_i2.HttpResponse<T>> patch<T>(
    String? url, {
    dynamic data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {#data: data},
        ),
        returnValue:
            _i3.Future<_i2.HttpResponse<T>>.value(_FakeHttpResponse_0<T>(
          this,
          Invocation.method(
            #patch,
            [url],
            {#data: data},
          ),
        )),
      ) as _i3.Future<_i2.HttpResponse<T>>);

  @override
  _i3.Future<_i2.HttpResponse<T>> delete<T>(
    String? url, {
    dynamic data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {#data: data},
        ),
        returnValue:
            _i3.Future<_i2.HttpResponse<T>>.value(_FakeHttpResponse_0<T>(
          this,
          Invocation.method(
            #delete,
            [url],
            {#data: data},
          ),
        )),
      ) as _i3.Future<_i2.HttpResponse<T>>);
}
