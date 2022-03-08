// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'counters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CountersStateTearOff {
  const _$CountersStateTearOff();

  _CountersState call({List<Counter> countersList = const <Counter>[]}) {
    return _CountersState(
      countersList: countersList,
    );
  }
}

/// @nodoc
const $CountersState = _$CountersStateTearOff();

/// @nodoc
mixin _$CountersState {
  List<Counter> get countersList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountersStateCopyWith<CountersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountersStateCopyWith<$Res> {
  factory $CountersStateCopyWith(
          CountersState value, $Res Function(CountersState) then) =
      _$CountersStateCopyWithImpl<$Res>;
  $Res call({List<Counter> countersList});
}

/// @nodoc
class _$CountersStateCopyWithImpl<$Res>
    implements $CountersStateCopyWith<$Res> {
  _$CountersStateCopyWithImpl(this._value, this._then);

  final CountersState _value;
  // ignore: unused_field
  final $Res Function(CountersState) _then;

  @override
  $Res call({
    Object? countersList = freezed,
  }) {
    return _then(_value.copyWith(
      countersList: countersList == freezed
          ? _value.countersList
          : countersList // ignore: cast_nullable_to_non_nullable
              as List<Counter>,
    ));
  }
}

/// @nodoc
abstract class _$CountersStateCopyWith<$Res>
    implements $CountersStateCopyWith<$Res> {
  factory _$CountersStateCopyWith(
          _CountersState value, $Res Function(_CountersState) then) =
      __$CountersStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Counter> countersList});
}

/// @nodoc
class __$CountersStateCopyWithImpl<$Res>
    extends _$CountersStateCopyWithImpl<$Res>
    implements _$CountersStateCopyWith<$Res> {
  __$CountersStateCopyWithImpl(
      _CountersState _value, $Res Function(_CountersState) _then)
      : super(_value, (v) => _then(v as _CountersState));

  @override
  _CountersState get _value => super._value as _CountersState;

  @override
  $Res call({
    Object? countersList = freezed,
  }) {
    return _then(_CountersState(
      countersList: countersList == freezed
          ? _value.countersList
          : countersList // ignore: cast_nullable_to_non_nullable
              as List<Counter>,
    ));
  }
}

/// @nodoc

class _$_CountersState with DiagnosticableTreeMixin implements _CountersState {
  const _$_CountersState({this.countersList = const <Counter>[]});

  @JsonKey()
  @override
  final List<Counter> countersList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CountersState(countersList: $countersList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CountersState'))
      ..add(DiagnosticsProperty('countersList', countersList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountersState &&
            const DeepCollectionEquality()
                .equals(other.countersList, countersList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(countersList));

  @JsonKey(ignore: true)
  @override
  _$CountersStateCopyWith<_CountersState> get copyWith =>
      __$CountersStateCopyWithImpl<_CountersState>(this, _$identity);
}

abstract class _CountersState implements CountersState {
  const factory _CountersState({List<Counter> countersList}) = _$_CountersState;

  @override
  List<Counter> get countersList;
  @override
  @JsonKey(ignore: true)
  _$CountersStateCopyWith<_CountersState> get copyWith =>
      throw _privateConstructorUsedError;
}
