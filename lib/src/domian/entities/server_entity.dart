class ServerUI {
  final String type;
  final DataModel? data;

  const ServerUI({
    required this.type,
    required this.data,
  });
}

class DataModel {
  final String key;
  final String mainAxisAlignment;
  final String crossAxisAlignment;
  final List<ChildrenModel>? children;

  const DataModel({
    required this.key,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.children,
  });
}

class ChildrenModel {
  final String type;
  final DateModel? date;

  const ChildrenModel({
    required this.type,
    required this.date,
  });
}

class DateModel {
  final String key;
  final String text;
  final StyleModel? style;

  const DateModel({
    required this.key,
    required this.text,
    required this.style,
  });
}

class StyleModel {
  final String color;
  final int fontSize;
  final String fontWeight;

  const StyleModel({
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  });
}
