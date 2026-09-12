// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleRecordDto _$ScheduleRecordDtoFromJson(Map<String, dynamic> json) =>
    ScheduleRecordDto(
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      id: json['id'] as String,
      building: json['building'] as String,
      json: (json['json'] as List<dynamic>)
          .map((e) => GroupScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$ScheduleRecordDtoToJson(ScheduleRecordDto instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'id': instance.id,
      'building': instance.building,
      'json': instance.json,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
    };
