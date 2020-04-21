import 'package:flutter/cupertino.dart';
import 'package:gotta_go_fast/models/cpu_model.dart';
import 'package:gotta_go_fast/models/developer_model.dart';

class ConsoleModel{
  String name;
  DeveloperModel developer;
  String iconUrl;
  List<String> games;
  CPUModel cpu;
  bool isliked;

  ConsoleModel({
   @required this.name,
   @required this.developer,
   @required this.cpu,
   this.games = const [],
   this.isliked = false,
   this.iconUrl
  });
}