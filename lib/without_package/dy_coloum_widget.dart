import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DynamicWidgetColum {
  @JsonKey(name: "key")
  String? key;
  @JsonKey(name: "pageTitle")
  String? pageTitle;
  @JsonKey(name: "child")
  Widget? child;
}
