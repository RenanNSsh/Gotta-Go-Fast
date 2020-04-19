import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/repository/console_repository.dart';

class ConsoleService{
  final ConsoleRepository repository = ConsoleRepository();

  Future<List<ConsoleModel>> findAll(){
    return repository.findAllConsoles();
  }
}