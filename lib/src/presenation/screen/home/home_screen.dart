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
  ServerUI? ui;

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
      body: ui != null
          ? Container(
              color: Colors.white,
              width: MediaQuery.sizeOf(context).width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment:
                      _getMainAlignment(ui?.data?.mainAxisAlignment),
                  crossAxisAlignment:
                      _getCrossAlignment(ui?.data?.crossAxisAlignment),
                  mainAxisSize: MainAxisSize.min,
                  key: Key(ui!.data!.key),
                  children: ui!.data!.children!
                      .map((e) => getWidgetFromJson(e))
                      .toList(),
                ),
              ),
            )
          : Container(),
    );
  }

  Widget getWidgetFromJson(ChildrenModel ui) {
    final widgetType = ui.type;
    switch (widgetType) {
      case "dy_text":
        {
          return _getTextWidget(
            ui.date ??
                const DateModel(
                  key: "key",
                  text: "text",
                  style: null,
                ),
          );
        }
    }
    return Container();
  }

  Text _getTextWidget(DateModel dateModel) {
    return Text(
      dateModel.text ?? "",
      style: TextStyle(
        color: Color(int.parse(dateModel.style?.color ?? "0XFF528346")),
        fontSize: double.parse(dateModel.style?.fontSize.toString() ?? "16"),
      ),
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
}
