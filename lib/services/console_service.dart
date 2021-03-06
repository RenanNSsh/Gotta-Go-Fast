import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/repository/console_repository.dart';

class ConsoleService{
  final ConsoleRepository _repository = ConsoleRepository();

  Future<List<ConsoleModel>> findAll(){
    return _repository.findAllConsoles();
  }

  Future<List<DeveloperModel>> findDevelopers() {
    return _repository.findAllDevelopers();
  }

  Future<List<ConsoleModel>> filterByText(String text) {
    if(text != null && text.isEmpty){
      return findAll();
    }
    return _repository.findConsole(text.toLowerCase());
  }

  Future<List<ConsoleModel>> filterByDeveloper(DeveloperModel developer){
    if(developer.name.toLowerCase() == "todos"){
      return _repository.findAllConsoles();
    }
    return _repository.findConsoleByDeveloper(developer.name.toLowerCase());
  }

  Future<List<ConsoleModel>> findLikeds() {
    return _repository.findLikeds();

  }

  Future<List<DeveloperModel>> findMyDevelopers() {
    return _repository.findMyDevelopers();
  }

  Future<List<ConsoleModel>> filterLikedsByDeveloper(DeveloperModel developer) {
    if(developer.name.toLowerCase() == "todos"){
      return _repository.findLikeds();
    }
    return _repository.findConsoleLikedByDeveloper(developer.name.toLowerCase());
  }

  Future<List<ConsoleModel>> filterLikedsByText(String text) {
    if(text != null && text.isEmpty){
      return findLikeds();
    }
    return _repository.findLikedsWith(text.toLowerCase());
  }

  Future<void> save(ConsoleModel consoleModel) async{
    await _repository.save(consoleModel);
  }

  Future<List<String>> findAllConsoleIcons() async {
    return await _repository.findAllConsoleIcons();
  }

  
  Future<List<String>> findAllDeveloperIcons() async {
    return await _repository.findAllDeveloperIcons();
  }

  Future<void> delete(ConsoleModel console) async{
    await _repository.delete(console);
  }



}