import 'package:json_annotation/json_annotation.dart';
import 'package:server_driven_ui_casa/src/domian/entities/server_entity.dart';

part 'remote_server_u_i.g.dart';

@JsonSerializable()
class RemoteServerUI {
  final String? type;
  final Data? data;

  const RemoteServerUI({
    this.type,
    this.data,
  });

  factory RemoteServerUI.fromJson(Map<String, dynamic> json) =>
      _$RemoteServerUIFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServerUIToJson(this);
}

@JsonSerializable()
class Data {
  final String? key;
  final String? mainAxisAlignment;
  final String? crossAxisAlignment;
  final List<Children>? children;

  const Data({
    this.key,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.children,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Children {
  final String? type;
  final Date? date;

  const Children({
    this.type,
    this.date,
  });

  factory Children.fromJson(Map<String, dynamic> json) =>
      _$ChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}

@JsonSerializable()
class Date {
  final String? key;
  final String? text;
  final Style? style;

  const Date({
    this.key,
    this.text,
    this.style,
  });

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}

extension StyleExtension on Style {
  StyleModel toDomain() {
    return StyleModel(
        color: color ?? "",
        fontSize: fontSize ?? 0,
        fontWeight: fontWeight ?? "");
  }
}

extension DateExtension on Date {
  DateModel toDomain() {
    return DateModel(
      style?.toDomain() ?? StyleModel(),
      key: key ?? "",
      text: text ?? "",
    );
  }
}

extension ChildernExtension on Children {
  ChildrenModel toDomain() {
    return ChildrenModel(
      date?.toDomain() ?? DateModel(StyleModel()),
      type: type ?? "",
    );
  }
}

extension ChildernListExtension on List<Children> {
  List<ChildrenModel> toChildrenList() {
    return map((e) => e.toDomain()).toList();
  }
}

extension DataExtension on Data {
  DataModel toDomain() {
    return DataModel(
      children?.toChildrenList() ?? [],
      key: key ?? "",
      mainAxisAlignment: mainAxisAlignment ?? "",
      crossAxisAlignment: crossAxisAlignment ?? "",
    );
  }
}

@JsonSerializable()
class Style {
  final String? color;
  final int? fontSize;
  final String? fontWeight;

  const Style({
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);

  Map<String, dynamic> toJson() => _$StyleToJson(this);
}

extension DrivenExtension on RemoteServerUI {
  ServerUI toDomain() {
    return ServerUI(
      data?.toDomain() ?? DataModel([]),
      type: type ?? "",
    );
  }
}
