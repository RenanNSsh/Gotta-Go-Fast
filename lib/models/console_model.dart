import 'package:flutter/cupertino.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';

class ConsoleModel{
  String name;
  String developer;
  List<String> games;
  CPUModel cpu;

  ConsoleModel({
   @required this.name,
   @required this.developer,
   @required this.cpu,
   this.games
  });
}