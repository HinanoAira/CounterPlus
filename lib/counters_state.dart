import 'counter.dart';
import 'counter_saveload.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counters_state.g.dart';
part 'counters_state.freezed.dart';

@freezed
abstract class CountersState implements _$CountersState {
  const CountersState._();

  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CountersState({
    @Default([]) List<Counter> countersList,
  }) = _CountersState;

  factory CountersState.fromJson(Map<String, dynamic> json) =>
      _$CountersStateFromJson(json);

  Future<bool> save() async {
    return await saveCounters(toJson());
  }
}
