import 'package:server_driven_ui_casa/src/domian/entities/server_entity.dart';
import 'package:server_driven_ui_casa/src/domian/repo/repo.dart';

class GetServerDrivenUIUseCase {
  final ServerDrivenUIRepository _repository;

  GetServerDrivenUIUseCase(this._repository);

  Future<ServerUI> call() async {
    return await _repository.getUi();
  }
}
