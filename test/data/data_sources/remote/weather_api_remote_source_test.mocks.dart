// Mocks generated by Mockito 5.4.4 from annotations
// in clean_architecture/test/data/data_sources/remote/weather_api_remote_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:clean_architecture/core/env.dart' as _i2;
import 'package:clean_architecture/core/network/network.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Env].
///
/// See the documentation for Mockito's code generation for more information.
class MockEnv extends _i1.Mock implements _i2.Env {
  MockEnv() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get weatherApiHost => (super.noSuchMethod(
        Invocation.getter(#weatherApiHost),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#weatherApiHost),
        ),
      ) as String);

  @override
  String get weatherApiKey => (super.noSuchMethod(
        Invocation.getter(#weatherApiKey),
        returnValue: _i3.dummyValue<String>(
          this,
          Invocation.getter(#weatherApiKey),
        ),
      ) as String);
}

/// A class which mocks [Network].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetwork extends _i1.Mock implements _i4.Network {
  MockNetwork() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<String> get(Uri? uri) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [uri],
        ),
        returnValue: _i5.Future<String>.value(_i3.dummyValue<String>(
          this,
          Invocation.method(
            #get,
            [uri],
          ),
        )),
      ) as _i5.Future<String>);
}
