import 'counter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'counters_state.freezed.dart';

@freezed
abstract class CountersState with _$CountersState {
  const factory CountersState({
    @Default(<Counter>[]) List<Counter> countersList,
  }) = _CountersState;
}
