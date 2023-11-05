import 'package:json_annotation/json_annotation.dart';

part 'header_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ServerDrivenResponse<T> {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'padding')
  double? padding;
  @JsonKey(name: 'child')
  T? child;

  ServerDrivenResponse({
    this.key,
    this.padding,
    this.child,
  });

  factory ServerDrivenResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ServerDrivenResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$ServerDrivenResponseToJson(this, (T t) {
        return t;
      });
}
