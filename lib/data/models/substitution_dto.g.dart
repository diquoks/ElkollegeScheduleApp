// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'substitution_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubstitutionDto _$SubstitutionDtoFromJson(Map<String, dynamic> json) =>
    SubstitutionDto(
      groupName: json['groupName'] as String,
      period: PeriodDto.fromJson(json['period'] as Map<String, dynamic>),
      substitution: PeriodDto.fromJson(
        json['substitution'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SubstitutionDtoToJson(SubstitutionDto instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'period': instance.period.toJson(),
      'substitution': instance.substitution.toJson(),
    };
