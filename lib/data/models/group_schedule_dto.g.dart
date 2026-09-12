// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupScheduleDto _$GroupScheduleDtoFromJson(Map<String, dynamic> json) =>
    GroupScheduleDto(
      groupName: json['groupName'] as String,
      daySchedules: (json['daySchedules'] as List<dynamic>)
          .map((e) => DayScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupScheduleDtoToJson(GroupScheduleDto instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'daySchedules': instance.daySchedules,
    };
