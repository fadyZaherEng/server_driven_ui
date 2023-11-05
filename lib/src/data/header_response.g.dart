// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerDrivenResponse<T> _$ServerDrivenResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ServerDrivenResponse<T>(
      key: json['key'] as String?,
      padding: (json['padding'] as num?)?.toDouble(),
      child: _$nullableGenericFromJson(json['child'], fromJsonT),
    );

Map<String, dynamic> _$ServerDrivenResponseToJson<T>(
  ServerDrivenResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'key': instance.key,
      'padding': instance.padding,
      'child': _$nullableGenericToJson(instance.child, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
