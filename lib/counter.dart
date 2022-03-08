import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'counter.g.dart';

@JsonSerializable()
@immutable
class Counter {
  const Counter(this.id, this.title, this.count);

  final int id;
  final String title;
  final int count;

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Map<String, dynamic> toJson() => _$CounterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CountersJson {
  CountersJson(this.counters);

  List<Counter> counters;

  factory CountersJson.fromJson(Map<String, dynamic> json) =>
      _$CountersJsonFromJson(json);

  Map<String, dynamic> toJson() => _$CountersJsonToJson(this);
}
