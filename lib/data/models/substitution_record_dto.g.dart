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
  utcDate: const PocketbaseDateTimeConverter().fromJson(
    json['utcDate'] as String,
  ),
  json: (json['json'] as List<dynamic>)
      .map((e) => SubstitutionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  created: const PocketbaseDateTimeConverter().fromJson(
    json['created'] as String,
  ),
  updated: const PocketbaseDateTimeConverter().fromJson(
    json['updated'] as String,
  ),
);

Map<String, dynamic> _$SubstitutionRecordDtoToJson(
  SubstitutionRecordDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'building': instance.building,
  'utcDate': const PocketbaseDateTimeConverter().toJson(instance.utcDate),
  'json': instance.json.map((e) => e.toJson()).toList(),
  'created': const PocketbaseDateTimeConverter().toJson(instance.created),
  'updated': const PocketbaseDateTimeConverter().toJson(instance.updated),
};
