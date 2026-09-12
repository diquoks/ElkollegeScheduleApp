// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayScheduleDto _$DayScheduleDtoFromJson(Map<String, dynamic> json) =>
    DayScheduleDto(
      weekday: (json['weekday'] as num).toInt(),
      periods: (json['periods'] as List<dynamic>)
          .map((e) => PeriodDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayScheduleDtoToJson(DayScheduleDto instance) =>
    <String, dynamic>{'weekday': instance.weekday, 'periods': instance.periods};
