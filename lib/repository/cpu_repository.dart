import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';

class CPURepository{
  Future<List<ConsoleModel>> findAllConsoles() async{
    await Future.delayed(Duration(seconds: 2));
    return [
      ConsoleModel(cpu: CPUModel(name: "MIPS R3000A"),developer: "Sony Computer Entertainment",name: "Playstation 1"),
      ConsoleModel(cpu: CPUModel(name: "MIPS R5900 Emotion Engine"),developer: "Sony Computer Entertainment",name: "Playstation 2"),
    ];
  }
}