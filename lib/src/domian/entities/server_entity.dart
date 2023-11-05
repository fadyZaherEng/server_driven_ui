class ServerUI {
  String type;
  DataModel data;

  ServerUI(
    this.data, {
    this.type = "",
  });
}

class DataModel {
  String key;
  String mainAxisAlignment;
  String crossAxisAlignment;
  List<ChildrenModel> children;

  DataModel(
    this.children, {
    this.key = "",
    this.mainAxisAlignment = "start",
    this.crossAxisAlignment = "start",
  });
}

class ChildrenModel {
  String type;
  DateModel date;

  ChildrenModel(
    this.date, {
    this.type = "dy_text",
  });
}

class DateModel {
  String key;
  String text;
  StyleModel style;

  DateModel(
    this.style, {
    this.key = "",
    this.text = "Const",
  });
}

class StyleModel {
  String color;
  int fontSize;
  String fontWeight;

  StyleModel({
    this.color = "0xFF586392",
    this.fontSize = 14,
    this.fontWeight = "normal",
  });
}
