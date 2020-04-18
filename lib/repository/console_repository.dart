import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';

class ConsoleRepository{
  Future<List<ConsoleModel>> findAllConsoles() async{
    await Future.delayed(Duration(seconds: 1));
    return [
      ConsoleModel(
        cpu: CPUModel(name: "MIPS R3000A"),
        developer: "Sony Computer Entertainment",
        name: "Playstation 1",
        iconUrl: "https://image.flaticon.com/icons/svg/1497/1497282.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(name: "MIPS R5900 Emotion Engine"),
        developer: "Sony Computer Entertainment",
        name: "Playstation 2",
        iconUrl: "https://image.flaticon.com/icons/svg/588/588258.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(name: "MIPS R5900 Emotion Engine"),
        developer: "Sony Computer Entertainment",
        name: "Playstation 3",
        iconUrl: "https://image.flaticon.com/icons/svg/871/871382.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(name: "MIPS R5900 Emotion Engine"),
        developer: "Nintendo",
        name: "Super Nintendo",
        iconUrl: "https://image.flaticon.com/icons/svg/141/141070.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(name: "MIPS R5900 Emotion Engine"),
        developer: "Nintendo",
        name: "Gameboy Color",
        iconUrl: "https://image.flaticon.com/icons/svg/2094/2094405.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(name: "MIPS R5900 Emotion Engine"),
        developer: "Nintendo",
        name: "Nintendo Wii",
        iconUrl: "https://image.flaticon.com/icons/svg/809/809655.svg"
      ),
    ];
  }
}