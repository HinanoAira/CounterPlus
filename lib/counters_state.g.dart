// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counters_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountersState _$$_CountersStateFromJson(Map<String, dynamic> json) =>
    _$_CountersState(
      countersList: (json['counters_list'] as List<dynamic>?)
              ?.map((e) => Counter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [Counter(0, 'カウンター', 0)],
    );

Map<String, dynamic> _$$_CountersStateToJson(_$_CountersState instance) =>
    <String, dynamic>{
      'counters_list': instance.countersList,
    };
