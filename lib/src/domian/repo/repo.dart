import 'package:server_driven_ui_casa/src/domian/entities/server_entity.dart';

abstract class ServerDrivenUIRepository {
  Future<ServerUI> getUi();
}
