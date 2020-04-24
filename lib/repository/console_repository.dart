import 'package:gotta_go_fast/models/console_model.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';

var _all = DeveloperModel(name: "Todos", iconUrl: "https://image.flaticon.com/icons/svg/2797/2797843.svg");
var _sony = DeveloperModel(name: "Sony Computer Entertainment", iconUrl: "https://image.flaticon.com/icons/svg/1/1443.svg");
var _nintendo = DeveloperModel(name: "Nintendo Co., Ltd",iconUrl: "https://image.flaticon.com/icons/svg/1752/1752776.svg");

var _allDevelopers = [
  _all,
  _sony,
  _nintendo
];

var _consoleIcons = [
  "https://image.flaticon.com/icons/svg/1408/1408986.svg", 
  "https://image.flaticon.com/icons/svg/667/667916.svg",
  "https://image.flaticon.com/icons/svg/744/744718.svg",
  "https://image.flaticon.com/icons/svg/732/732260.svg",
  "https://image.flaticon.com/icons/svg/2285/2285776.svg",
  "https://image.flaticon.com/icons/svg/771/771210.svg",
  "https://image.flaticon.com/icons/svg/1816/1816034.svg",
  "https://image.flaticon.com/icons/svg/742/742270.svg"
];

var _developerIcons = [
  "https://image.flaticon.com/icons/svg/871/871361.svg",
  "https://image.flaticon.com/icons/svg/1/1443.svg",
  "https://image.flaticon.com/icons/svg/1752/1752776.svg",
  "https://image.flaticon.com/icons/svg/732/732221.svg",
  "https://image.flaticon.com/icons/svg/871/871390.svg"
];


var _consoles = [
      ConsoleModel(
        cpu: CPUModel(
          infoUrl: "https://en.wikipedia.org/wiki/R3000",
          clockRate: "33 MHz",
          coreAmout: 1,
          cacheSize: "5 KB",
          name: "MIPS R3000",
          flops: "16 MFLOPS",
          description: "O R3000 é um chipset de microprocessador RISC de 32 bits desenvolvido pela MIPS Computer Systems que implementou a arquitetura de conjunto de instruções (ISA) do MIPS I. Introduzida em junho de 1988, foi a segunda implementação do MIPS, sucedendo o R2000 como o microprocessador principal do MIPS."
          ),
        developer: _sony,
        games: ["https://s2.glbimg.com/gQ90wGlaGxRYProvuUNdnbJlPBI=/0x0:695x391/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2017/K/g/f3EkjfR5WVFdsGQu0vXQ/crash6.jpg","https://muralgamer.com/wp-content/uploads/2013/12/Resident-Evil-3-Nemesis.jpg"],
        name: "Playstation 1",
        iconUrl: "https://image.flaticon.com/icons/svg/1497/1497282.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(
          infoUrl: "https://pt.qwe.wiki/wiki/Emotion_Engine",
          name: "MIPS R5900 Emotion Engine",
          clockRate: "294.912 MHz",
          coreAmout: 1,
          flops: "6.2 GFLOPS",
          description: "O Emotion Engine é uma unidade de processamento central desenvolvido e fabricado pela Sony Computer Entertainment e Toshiba para uso no PlayStation 2 console de videogame . Ele também foi usado nos primeiros PlayStation 3 modelos vendidos no Japão e América do Norte (modelo Números CECHAxx & CECHBxx), para fornecer suporte game PlayStation 2. A produção em massa do Emotion Engine começou em 1999 e terminou no final de 2012 com a descontinuação do PlayStation 2."
        ),
        games: ["https://i.pinimg.com/originals/2f/e0/18/2fe01825d5cd95e63cf1d06388ad99b8.jpg","https://timeline.canaltech.com.br/271064.1400/analise-shadow-of-the-colossus-ja-era-incrivel-agora-se-tornou-indescritivel.jpg"],
        developer: _sony,
        name: "Playstation 2",
        iconUrl: "https://image.flaticon.com/icons/svg/588/588258.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(
          infoUrl: "https://www.ibm.com/ibm/history/ibm100/us/en/icons/cellengine/",
          name: "Cell Broadband Engine",
          clockRate: "4 GHz",
          cacheSize: "576 KiB",
          coreAmout: 9,
          flops: '1 TFLOPS',
          description: 'Cell é o nome para uma arquitetura de microprocessador desenvolvida em conjunto pela Sony, Toshiba e IBM, numa aliança conhecida como "STI". Do projeto da arquitetura até a primeira implementação foram gastos quatro anos, começando em Março de 2001, num custo estimado pela IBM de 400 milhões de USD.'
        ),
        games:["https://s2.glbimg.com/7KXogWYurXlrZKzLjQMMGgCjuYA=/695x0/s.glbimg.com/po/tt2/f/original/2014/02/13/jogo.jpg","https://playtoo.com.br/playmidia/uploads/2019/06/bloggif_5d0584c500beb.jpg",],
        developer: _sony,
        name: "Playstation 3",
        iconUrl: "https://image.flaticon.com/icons/svg/871/871382.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(
          infoUrl: "https://pt.wikipedia.org/wiki/Ricoh_5A22",
          name: "Ricoh 5A22",
          coreAmout: 1,
          clockRate: "21.48MHz",
          description: "O Ricoh 5A22 é um microprocessador produzido pela Ricoh para o console de jogos eletrônicos Super Nintendo Entertainment System (SNES). O 5A22 é baseado em torno do CMD/GTE 65c816 16-bit, por si só uma versão do WDC 65C816 (usado no computador pessoal Apple IIGS)."
        ),
        games: ["https://i1.wp.com/www.memoriabit.com.br/wp-content/uploads/2019/07/super-mario-world-banner.png?fit=741%2C483&ssl=","https://http2.mlstatic.com/cartucho-aladdin-jogo-snes-super-nintendo-capcom-aladin-D_NQ_NP_772549-MLB26951789330_032018-F.jpg","https://img.olx.com.br/images/67/671920012163244.jpg"],
        developer: _nintendo,
        name: "Super Nintendo",
        iconUrl: "https://image.flaticon.com/icons/svg/141/141070.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(
          infoUrl: "https://realboyemulator.wordpress.com/2013/01/01/the-nintendo-game-boy-1/",
          name: "Sharp LR35902",
          clockRate: "4.19/8.38 MHz",
          coreAmout: 1,
          description: "O Game Boy é alimentado por um microprocessador bastante simples, o que o torna um alvo ideal para aprender sobre arquitetura de computadores através da emulação. A CPU é na verdade um híbrido entre o Intel 8080 e o Zilog Z80. O Z80 foi projetado para ser binário compatível com o Intel 8080 já existente. Isso significa que o conjunto de instruções encontrado no 8080 também foi implementado pelo Z80 (em essência, o 8080 pode ser visto como um subconjunto do Z80). O nome oficial do chip híbrido personalizado do Game Boy é Sharp LR35902."
        ),
        developer: _nintendo,
        games: ["https://michibiku.com/wp-content/uploads/2019/03/lozoracle.jpg","https://4.bp.blogspot.com/-Z7p56iQOwmo/VY3YXBM0qAI/AAAAAAAAELo/yd7PEJpV-LI/s1600/01.jpg"],
        name: "Gameboy Color",
        iconUrl: "https://image.flaticon.com/icons/svg/2094/2094405.svg"
      ),
      ConsoleModel(
        cpu: CPUModel(
          infoUrl: "https://pt.wikipedia.org/wiki/Broadway_(microprocessador)",
          name: "Broadway",
          clockRate: "729 MHz",
          coreAmout: 1,
          flops: "2.9 GFLOPS",
          cacheSize: "320KB",
          description: "Broadway é a Unidade Central de Processamento (CPU), utilizado no console de videogame Wii. Foi criado e concebido pela IBM para a Nintendo, e é produzido utilizando um processo de 90 nm SOI. Isto permite que o chip gaste 20% menos de energia do que o seu antecessor, a 180 nm Gekko, que foi utilizado e fabricado no antigo console da Nintendo o Nintendo GameCube. Há uma expectativa que o Broadway é muito similar ao do Xbox 360 da Microsoft."
        ),
        games: ["https://i.etsystatic.com/10064703/r/il/90cd77/671173857/il_570xN.671173857_c9pp.jpg","https://cdn.startselect.com/production/products/images/9eee7/33011/73763642-360x360.jpg"],
        developer: _nintendo,
        name: "Nintendo Wii",
        iconUrl: "https://image.flaticon.com/icons/svg/809/809655.svg"
      ),
    ];

class ConsoleRepository{
  Future<List<ConsoleModel>> findAllConsoles() async{
    await Future.delayed(Duration(milliseconds: 500));
    return _consoles;
  }

  Future<List<DeveloperModel>> findAllDevelopers() async{
    await Future.delayed(Duration(milliseconds: 500));
    return _allDevelopers;
  }

  Future<List<ConsoleModel>> findConsole(String text) async{
    await Future.delayed(Duration(milliseconds: 500));
    var sameText = (ConsoleModel console) => console.name.toLowerCase().contains(text) ||
                                console.cpu.name.toLowerCase().contains(text) || 
                                console.developer.name.toLowerCase().contains(text);
    var consoles = _consoles.where(sameText).toList();
    return consoles;
  }

  Future<List<ConsoleModel>> findConsoleByDeveloper(String developerName) async{
    await Future.delayed(Duration(milliseconds: 500));
    var findDeveloperName = (ConsoleModel console) => developerName == console.developer.name.toLowerCase();
    var consoles = _consoles.where(findDeveloperName).toList();
    return consoles;

  }

  Future<List<ConsoleModel>> findLikeds() async{
    await Future.delayed(Duration(milliseconds: 500));
    var likeds = (ConsoleModel console) => console.isliked;
    var consoles = _consoles.where(likeds).toList();
    return consoles;
  }

  Future<List<DeveloperModel>> findMyDevelopers() async {
    var consoles = await findLikeds();
    var myDevelopers = consoles.map((console)=>console.developer).toSet().toList();
    return [
      _all,
      ...myDevelopers
    ];
  }

  Future<List<ConsoleModel>> findConsoleLikedByDeveloper(String developerName) async{
    await Future.delayed(Duration(milliseconds: 500));
    var findDeveloper = (ConsoleModel console) => developerName == console.developer.name.toLowerCase() && console.isliked;
    var consoles = _consoles.where(findDeveloper).toList();
    return consoles;
  }

  Future<List<ConsoleModel>> findLikedsWith(String text) async{
    await Future.delayed(Duration(milliseconds: 500));
    var sameText = (ConsoleModel console) => console.name.toLowerCase().contains(text) ||
                                console.cpu.name.toLowerCase().contains(text) || 
                                console.developer.name.toLowerCase().contains(text);
    var liked = (ConsoleModel console) => console.isliked;
    var consoles = _consoles.where(sameText)
                            .where(liked)
                            .toList();
    return consoles;
  }

  Future<void> save(ConsoleModel consoleModel) async{
    await Future.delayed(Duration(milliseconds: 500));
    var existingDeveloper = _allDevelopers.firstWhere((developer) => developer.name == consoleModel.developer.name || developer.iconUrl == consoleModel.developer.iconUrl,orElse: (){
      _allDevelopers.add(consoleModel.developer);
    });
    if(existingDeveloper != null){
      consoleModel.developer = existingDeveloper;
    }
      _consoles.add(consoleModel);
  }

  Future<List<String>> findAllConsoleIcons() async{
    await Future.delayed(Duration(milliseconds: 500));
    return _consoleIcons;
  }

  Future<List<String>> findAllDeveloperIcons() async{
    await Future.delayed(Duration(milliseconds: 500));
    return _developerIcons;
  }

  Future<void> delete(ConsoleModel console) async{
    await Future.delayed(Duration(milliseconds: 500));
    _consoles.removeWhere((consoleList) => consoleList.name == console.name && consoleList.cpu.name == console.cpu.name);
  }
}