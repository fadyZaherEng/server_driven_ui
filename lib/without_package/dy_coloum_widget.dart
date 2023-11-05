// ignore_for_file: empty_catches

import 'package:flutter/material.dart';

Widget? getWidgetFromJson(Map<String, dynamic> json, BuildContext context) {
  final widgetType = json['type'];
  if (widgetType == null) return null;
  switch (widgetType) {
    case "text_widget":
      {
        return _getTextWidget(json, context);
      }
  }
  return Container();
}

Text _getTextWidget(Map<String, dynamic> json, BuildContext context) {
  final attributes = json['attributes'];
  if (attributes == null) return const Text("");
  String hint = '';
  hint = attributes['hint'].toString();

  TextStyle? textStyle;
  TextAlign textAlign = TextAlign.center;

  final style = attributes['text_style'];
  if (style != null) {
    final font = style['font'];
    final fontSize = style['font_size'];
    Color color = Colors.black;
    try {
      color = Color(int.parse(style['color']));
    } catch (e) {}
    // textStyle = getTextStyle(font: font, fontSize: fontSize, color: color);

    final align = style['text_align'];
    switch (align) {
      case 'left':
        {
          textAlign = TextAlign.left;
          break;
        }
      case 'right':
        {
          textAlign = TextAlign.right;
          break;
        }
      case 'justify':
        {
          textAlign = TextAlign.justify;
          break;
        }
      case 'start':
        {
          textAlign = TextAlign.start;
          break;
        }
      case 'end':
        {
          textAlign = TextAlign.end;
          break;
        }
    }
    return Text(
      hint,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
  return const Text("");
}
