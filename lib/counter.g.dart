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
