import 'package:flutter/cupertino.dart';
import 'package:gotta_go_fast/extensions/string_extension.dart';

class CPUModel{
  String name;
  String description;
  String clockRate;
  int coreAmout;
  String cacheSize;
  String flops;
  String infoUrl;

  CPUModel({
   @required this.name,
   this.infoUrl,
   this.description,
   this.clockRate,
   this.coreAmout,
   this.cacheSize,
   this.flops,
  }){
    this.name = this.name.firstLetterToUpperCase;
    
  }
}