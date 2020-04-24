import 'package:flutter/cupertino.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';
import 'package:gotta_go_fast/extensions/string_extension.dart';

class ConsoleModel{
  String name;
  DeveloperModel developer;
  String iconUrl;
  List<String> games;
  CPUModel cpu;
  bool isliked;
  List<String> imagesGamesDevice;

  ConsoleModel({
   @required this.name,
   @required this.developer,
   @required this.cpu,
   this.games = const [],
   this.isliked = false,
   this.iconUrl, 
   this.imagesGamesDevice = const [],
  }){
    this.name = this.name.titleCap;
    
  }
}