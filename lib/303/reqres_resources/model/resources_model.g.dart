// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourcesModel _$ResourcesModelFromJson(Map<String, dynamic> json) =>
    ResourcesModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResourcesModelToJson(ResourcesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      year: json['year'] as int?,
      color: json['color'] as String?,
      status: $enumDecodeNullable(_$StatusCodeEnumMap, json['status']),
      pantoneValue: json['pantoneValue'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantoneValue': instance.pantoneValue,
      'status': _$StatusCodeEnumMap[instance.status],
    };

const _$StatusCodeEnumMap = {
  StatusCode.succes: 200,
  StatusCode.weird: 500,
};
