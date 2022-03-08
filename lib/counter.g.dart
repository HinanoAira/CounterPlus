// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counter _$CounterFromJson(Map<String, dynamic> json) => Counter(
      json['id'] as int,
      json['title'] as String,
      json['count'] as int,
    );

Map<String, dynamic> _$CounterToJson(Counter instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
    };

CountersJson _$CountersJsonFromJson(Map<String, dynamic> json) => CountersJson(
      (json['counters'] as List<dynamic>)
          .map((e) => Counter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountersJsonToJson(CountersJson instance) =>
    <String, dynamic>{
      'counters': instance.counters.map((e) => e.toJson()).toList(),
    };
