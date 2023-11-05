// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_server_u_i.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServerUI _$RemoteServerUIFromJson(Map<String, dynamic> json) =>
    RemoteServerUI(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteServerUIToJson(RemoteServerUI instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      key: json['key'] as String?,
      mainAxisAlignment: json['mainAxisAlignment'] as String?,
      crossAxisAlignment: json['crossAxisAlignment'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Children.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'key': instance.key,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'children': instance.children,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      type: json['type'] as String?,
      date: json['date'] == null
          ? null
          : Date.fromJson(json['date'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      key: json['key'] as String?,
      text: json['text'] as String?,
      style: json['style'] == null
          ? null
          : Style.fromJson(json['style'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'key': instance.key,
      'text': instance.text,
      'style': instance.style,
    };

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      color: json['color'] as String?,
      fontSize: json['fontSize'] as int?,
      fontWeight: json['fontWeight'] as String?,
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'color': instance.color,
      'fontSize': instance.fontSize,
      'fontWeight': instance.fontWeight,
    };
