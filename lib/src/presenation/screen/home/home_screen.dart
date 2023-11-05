import 'package:flutter/material.dart';
import 'package:server_driven_ui_casa/src/data/repositories/server_drive_repo_impl.dart';
import 'package:server_driven_ui_casa/src/domian/entities/server_entity.dart';
import 'package:server_driven_ui_casa/src/domian/use_case/server_driven_use_case.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ServerUI ui = ServerUI(DataModel([]));
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    initMethod();
  }

  void initMethod() async {
    ui = await GetServerDrivenUIUseCase(ServerDrivenUIRepoImpl()).call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server Drive UI"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: _getMainAlignment(ui.data.mainAxisAlignment),
            crossAxisAlignment: _getCrossAlignment(ui.data.crossAxisAlignment),
            mainAxisSize: MainAxisSize.min,
            key: Key(ui.data.key),
            children:
                ui.data.children.map((e) => getWidgetFromJson(e)).toList(),
          ),
        ),
      ),
    );
  }

  Widget getWidgetFromJson(ChildrenModel ui) {
    final widgetType = ui.type;
    switch (widgetType) {
      case "dy_text":
        {
          return _getTextWidget(ui.date);
        }
      case "dy_date":
        {
          return _getDateWidget(ui.date);
        }
      case "dy_text_field":
        {
          return _getTextFieldWidget(ui.date);
        }
    }
    return Container();
  }

  Widget _getTextWidget(DateModel dateModel) {
    return Text(
      dateModel.text,
      style: TextStyle(
        color: Color(int.parse(dateModel.style.color)),
        fontSize: double.parse(dateModel.style.fontSize.toString()),
      ),
    );
  }

  Widget _getTextFieldWidget(DateModel dateModel) {
    controller.text = dateModel.text;
    return TextFormField(
        controller: controller,
        key: Key(dateModel.key),
        style: TextStyle(
          color: Color(int.parse(dateModel.style.color)),
          fontSize: double.parse(dateModel.style.fontSize.toString()),
        ),
        decoration: InputDecoration(
          hintText: dateModel.text,
        ));
  }

  Widget _getDateWidget(DateModel dateModel) {
    return InkWell(
      onTap: () {
        _selectDate();
      },
      child: const Icon(Icons.date_range),
    );
  }

  MainAxisAlignment _getMainAlignment(String? mainAxisAlignment) {
    switch (mainAxisAlignment) {
      case "spaceBetween":
        {
          return MainAxisAlignment.spaceBetween;
        }
      case "center":
        {
          return MainAxisAlignment.center;
        }
      case "start":
        {
          return MainAxisAlignment.start;
        }
    }
    return MainAxisAlignment.spaceAround;
  }

  CrossAxisAlignment _getCrossAlignment(String? crossAxisAlignment) {
    switch (crossAxisAlignment) {
      case "spaceBetween":
        {
          return CrossAxisAlignment.end;
        }
      case "center":
        {
          return CrossAxisAlignment.center;
        }
      case "start":
        {
          return CrossAxisAlignment.start;
        }
    }
    return CrossAxisAlignment.baseline;
  }

  DateTime? selectedDate = DateTime.now();

  void _selectDate() async {
    var chosenDateTime = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: Colors.pink)),
          child: child!,
        );
      },
    );
    if (chosenDateTime != null) {
      selectedDate = chosenDateTime;
      ui.data.children = ui.data.children.map((ChildrenModel e) {
        if (e.type == "dy_text_field") {
          e.date.text = chosenDateTime.toString();
          return e;
        }
        return e;
      }).toList();
      setState(() {});
    } else {
      selectedDate = null;
    }
  }
}
