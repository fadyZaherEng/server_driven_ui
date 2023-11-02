import 'package:flutter/material.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:server_driven_ui_casa/custom_widgets/dy_widget_card.dart';

void main() {
  Map<String, DynamicWidgetHandler> widgetHandlerMap = {
    "dy_widget_card": (json) => DynamicWidgetCard.fromJson(json)
  };

  ServeDynamicUI.init(
    widgetHandlers: widgetHandlerMap,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Server Driven UI');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ServeDynamicUIMaterialApp(
      home: (context) {
        return ServeDynamicUI.fromAssets('assets/json/sample.json');
      },
      title: 'Server Driven UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
