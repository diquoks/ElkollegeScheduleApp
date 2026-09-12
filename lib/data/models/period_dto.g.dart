// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodDto _$PeriodDtoFromJson(Map<String, dynamic> json) => PeriodDto(
  number: (json['number'] as num).toInt(),
  subgroup: (json['subgroup'] as num?)?.toInt(),
  subject: json['subject'] as String,
  lecturer: json['lecturer'] as String,
  room: json['room'] as String,
);

Map<String, dynamic> _$PeriodDtoToJson(PeriodDto instance) => <String, dynamic>{
  'number': instance.number,
  'subgroup': instance.subgroup,
  'subject': instance.subject,
  'lecturer': instance.lecturer,
  'room': instance.room,
};
