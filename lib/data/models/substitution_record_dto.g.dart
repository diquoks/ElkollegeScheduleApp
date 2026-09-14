// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substitution_record_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubstitutionRecordDto _$SubstitutionRecordDtoFromJson(
  Map<String, dynamic> json,
) => SubstitutionRecordDto(
  id: json['id'] as String,
  building: json['building'] as String,
  utcDate: DateTime.parse(json['utcDate'] as String),
  json: (json['json'] as List<dynamic>)
      .map((e) => SubstitutionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  created: DateTime.parse(json['created'] as String),
  updated: DateTime.parse(json['updated'] as String),
);

Map<String, dynamic> _$SubstitutionRecordDtoToJson(
  SubstitutionRecordDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'building': instance.building,
  'utcDate': instance.utcDate.toIso8601String(),
  'json': instance.json.map((e) => e.toJson()).toList(),
  'created': instance.created.toIso8601String(),
  'updated': instance.updated.toIso8601String(),
};
