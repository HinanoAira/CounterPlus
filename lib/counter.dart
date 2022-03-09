import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.g.dart';

@immutable
@JsonSerializable()
class Counter {
  const Counter(this.id, this.title, this.count);

  final int id;
  final String title;
  final int count;

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);
  Map<String, dynamic> toJson() => _$CounterToJson(this);
}
